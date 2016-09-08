class ReservationsController < ApplicationController

  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.create(reservation_params)
    redirect_to reservation_path(reservation)
  end

  def show
  end

  def edit
  end

  def update
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
