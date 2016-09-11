class ReservationsController < ApplicationController
  before_action :authorize
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(reservation_params) #makes a new reservation (not yet saved! with the reqested dates )
    venue_id = params[:reservation][:venue_id]
    listing = Listing.all.where("venue_id = ? AND available_start_date <= ? AND available_end_date >= ?", venue_id, reservation.start_date, reservation.end_date) #looks up any listings
    if listing != []
      reservation.renter_id= current_user.id
      reservation.listing = listing.first
        if reservation.save
          #ReservationRequestMailer.reservation_request_email(reservation.host).deliver
          redirect_to reservation_path(reservation), notice: "Your reservation was sucessfully created."
        else
          @venue = Venue.find(venue_id)

          redirect_to venue_path(Venue.find(venue_id)), notice: "Please select a valid date range (call reservation.errors.messages maybe)"  #render :'venues/show', notice: "Please select a valid date range (call reservation.errors.messages maybe)"
        end
    else

      redirect_to venue_path(Venue.find(venue_id)), notice: "Please select a valid date range (call reservation.errors.messages maybe)" #should be render
    end
    # set up email and date verification/error message conditional for .save
  end

  def show
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    # include some logic to see if "confirmed" has changed to true...
    # ReservationConfirmationMailer.reservation_confirmation_email(@reservation.renter).deliver
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :start_time, :end_time, :confirmed, :comment)
  end

end
