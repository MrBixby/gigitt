class BandController < ApplicationController
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
    @band.user_ids = [current_user.id]
    @band = Band.new(band_params)

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
      params.require(:band).permit(:name, :user_ids => [])
  end
end
