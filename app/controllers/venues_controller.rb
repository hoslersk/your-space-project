class VenuesController < ApplicationController

  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.create(venue_params)
    redirect_to venue_path(@venue)
  end

  def show
    listings = @venue.listings
    hash = {}
    listings.each do |listing|
      listing.reservations.each do |res|
      end
    end


  end

  def index
    @venues = Venue.all
  end

  def edit
  end

  def update
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
  end

  def destroy
    @venue.delete
    redirect_to venues_path
  end

 private

 def set_venue
   @venue = Venue.find(params[:id])
 end

 def venue_params
   params.require(:venue).permit(:name, :address, :description, :host_id)
 end

end
