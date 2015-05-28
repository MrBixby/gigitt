class VenuesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def show
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = current_user.venues.create(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  def follow
    @venue = Venue.find(params[:venue_id])
    current_band.follow!(@venue)
    redirect_to venues_path
  end

  def unfollow
    @venue = Venue.find(params[:venue_id])
    current_band.unfollow!(@venue)
    redirect_to venues_path
  end

  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end

  def venue_params
      params.require(:venue).permit(:name, :description, :address, :city, :state, :zip, :phone, :email, :twitter, :facebook, :instagram, :user_ids => [])
  end
end
