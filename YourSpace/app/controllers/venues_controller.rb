class VenuesController < ApplicationController

  def new
    @venue = Venue.new

  end

  def create
    @venue = Venue.create(safe_params)
    redirect_to venue_path(@venue)

  end

  def show
    @venue = Venue.find(params[:id])

  end

  def index
    @venues = Venue.all

  end

  def edit
    @venue = Venue.find(params[:id])

  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(safe_params)
    redirect_to venue_path(@venue)

  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.delete

    redirect_to venues_path


  end

 private

 def safe_params

   params.require(:venue).permit(:name, :address, :description, :host_id)

 end



end
