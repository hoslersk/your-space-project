class ListingsController < ApplicationController

  def show
    @listing = Listing.find(params[:id])
  end

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(safe_params)
    redirect_to listing_path(@listing)
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    #byebug
    @listing = Listing.find(params[:id])
    @listing.update(safe_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private

  def safe_params
    params.require(:listing).permit(:venue_id, :available_start_date, :available_end_date, :available_start_time, :available_end_time)
  end

end
