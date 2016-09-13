class ListingsController < ApplicationController
  before_action :authorize, except: [:show, :index]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def show
    @listing = Listing.find(params[:id])
    # @listing.each do |list|
    #   @list_dates = []

  end

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.new(listing_params)
    if listing.save
      redirect_to venue_path(listing_params[:venue_id])
    else
      redirect_to venue_path(listing_params[:venue_id]), notice: listing.errors.full_messages.join(". ")
    end

  end

  def edit #delete
    @listing = Listing.find(params[:id])
  end

  def update #delete
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    listing = Listing.find(params[:id])
    # venue_id = @listing.venue_id
    listing.reservations.destroy_all
    # @listing.reservations.each do |res|
    #   res.destroy
    # end
    # CancellationMailer.cancellation_mail(@reservation.host).deliver
    # CancellationMailer.cancellation_mail(@reservation.renter).deliver
    listing.destroy
    @listings = Venue.find(listing.venue_id).listings
    respond_to do |format|
      format.js
      # render HTML if not a ajax request
      # format.html
    end
    # redirect_to venue_path(venue_id)
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:venue_id, :available_start_date, :available_end_date, :available_start_time, :available_end_time, :price)
  end

end
