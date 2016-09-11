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
    reservation = Reservation.new(reservation_params)
    # set up email conditional for .save
    # ReservationRequestMailer.reservation_request_email(@reservation.host).deliver
    reservation.save
    redirect_to reservation_path(reservation)
  end

  def show
  end

  def edit
  end

  def update
    # include some logic to see if "confirmed" has changed to true...
    # ReservationConfirmationMailer.reservation_confirmation_email(@reservation.renter).deliver
    @reservation.update(reservation_params)
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
    params.require(:reservation).permit(:listing_id, :renter_id, :start_date, :end_date, :start_time, :end_time, :confirmed, :comment)
  end

end
