class ReservationsController < ApplicationController
  before_action :authorize
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @user = current_user
  end

  def new
    @reservation = Reservation.new
  end

  def create
    #makes a new reservation (not yet saved! with the reqested dates)
    reservation = Reservation.new(reservation_params)
    # set venue_id with params
    venue_id = params[:reservation][:venue_id]
    #use venue_id to run ActiveRecord query to locate the one listing (if it exists) that encompasses the desired reservation date rage
    listing = Listing.all.where("venue_id = ? AND available_start_date <= ? AND available_end_date >= ?", venue_id, reservation.start_date, reservation.end_date) #looks up any listings
    # if there exists a listing, set renter_id to current_user and associate reservation listing
    if listing != []
      reservation.renter_id = current_user.id
      reservation.listing = listing.first
        # run save to run reservation validations
        if reservation.save
          ReservationRequestMailer.reservation_request_email(reservation.host).deliver
          redirect_to reservation_path(reservation)
        else
          # redirect to venue show page if cannot save
          # binding.pry
          redirect_to venue_path(Venue.find(venue_id)), notice: reservation.errors.full_messages.join(". ")
        end
    else
      redirect_to venue_path(Venue.find(venue_id)), notice: "Please select dates where there is a listing" #should be render
    end
    # set up email and date verification/error message conditional for .save

  end

  def show

  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    if @reservation.errors.any?
      redirect_to reservation_path(@reservation), notice: @reservation.errors.full_messages.join(". ")
    else
      if params[:reservation][:confirmed]
        ReservationConfirmationMailer.reservation_confirmation_email(@reservation.renter).deliver
      else
        ReservationUpdateMailer.reservation_update_email(@reservation.host).deliver
      end
      redirect_to reservation_path(@reservation)
    end
  end

  def destroy
    @reservation.destroy
    CancellationMailer.cancellation_mail(@reservation.host).deliver
    CancellationMailer.cancellation_mail(@reservation.renter).deliver
    redirect_to reservations_path, notice: "This reservation has been deleted!"
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :start_time, :end_time, :confirmed, :comment)
  end

end
