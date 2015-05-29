class GigsController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_venue, only: [:index, :show, :new, :create, :edit, :update]

  def index
    @gigs = @venue.gigs.all
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = @venue.gigs.new
  end

  def create
    @gig = @venue.gigs.new(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to dashboard_path, notice: 'Gig was successfully created.' }
        format.json { render :show, status: :created, location: dashboard_path }
      else
        format.html { render :new }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @gig = @venue.gigs.find(params[:id])
    @bandlists = @gig.bandlists.all
  end

  def update
    @gig = @venue.gigs.find(params[:id])
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to dashboard_path, notice: 'Gig was successfully updated.' }
        format.json { render :show, status: :ok, location: dashboard_path }
      else
        format.html { render :edit }
        format.json { render json: @gig.errors, status: :unprocessable_entity }
      end
    end
  end

  def finalize
    @gig = Gig.find(params[:id])
    @gig.is_final = true
    respond_to do |format|
      if @gig.save
        format.html { redirect_to dashboard_path, notice: 'Gig was finalized.'}
        format.json { render :show, status: :ok, location: @gig }
      else
        format.html { render :edit }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    @gig = @venue.gigs.find(params[:id])
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Gig was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_venue
      @venue = Venue.find(params[:venue_id])
    end

    def gig_params
      params.require(:gig).permit(:date, :showtime, :doors, :openings,
        :pay_amount, :paid_gig, :notes, :venue_id, :event, :age, :price, 
        :description, :is_final, :band_ids =>[], :hired_bands => [])
    end
end
