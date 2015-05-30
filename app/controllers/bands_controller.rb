class BandsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def show

  end

  def new
    @band = Band.new
  end

  def create
    @band = current_user.bands.create(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  def apply_for_gig
    @band = current_band
    @gig = Gig.find(params[:gig_id])
    @band.gigs.push(@gig)
    redirect_to dashboard_path, notice: 'Applied for Gig'
  end

  def cancel_gig_app
    @band = current_band
    @gig = Gig.find(params[:gig_id])
    @band.gigs.delete(@gig)
    redirect_to dashboard_path, notice: 'Application Cancelled'
  end

  def destroy
    @band.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Band was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_band
      @band = Band.find(params[:id])
    end

  def band_params
    params.require(:band).permit(:name, :genre, :description, :city, :zip, :twitter, :instagram, :facebook, :soundcloud, :last_fm, :user_ids => [])
  end
end
