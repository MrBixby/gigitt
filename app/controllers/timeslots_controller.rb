class TimeslotsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  def index
    @timeslots = Timeslot.find(params[:venue_id])
  end

  def show
  end

  def new
    @timeslot = Timeslot.new
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    @timeslot.user_id = current_user.id

    respond_to do |format|
      if @timeslot.save
        format.html { redirect_to @timeslot, notice: 'Timeslot was successfully created.' }
        format.json { render :show, status: :created, location: @timeslot }
      else
        format.html { render :new }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @timeslot.update(venue_params)
        format.html { redirect_to @timeslot, notice: 'Timeslot was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeslot }
      else
        format.html { render :edit }
        format.json { render json: @timeslot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timeslot.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Timeslot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_timeslot
      @timeslot = Timeslot.find(params[:id])
    end

  def timeslot_params
    params.require(:fan).permit(:date, :start_time, :end_time, :openings, :pay_amount, :paid_gig, :notes, :venue_id )
  end
end
