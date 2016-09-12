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
    listing = Listing.create(listing_params)
    # if listing is not saved, create flash messages
    if listing.id == nil
      flash[:notice] = ""
      listing.errors.messages.each do |attribute, error_message_array|
        error_message_array.each do |error_message|
          flash[:notice] << error_message
        end
      end
    end
    # redirect to venue show page
    redirect_to venue_path(listing_params[:venue_id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:venue_id, :available_start_date, :available_end_date, :available_start_time, :available_end_time, :price)
  end

end
