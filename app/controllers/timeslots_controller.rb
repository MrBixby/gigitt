class TimeslotsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]

  def index
    @timeslots = Timeslot.find(params[:venue_id])
  end

  def show
    @timeslot = Timeslot.find(params[:id])
  end

  def new
    @venue = Venue.find(params[:venue_id])
    @timeslot = @venue.timeslots.new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @timeslot = @venue.timeslots.new(timeslot_params)

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
    @timeslot = Timeslot.find(params[:id])
  end

  def update
    @timeslot = Timeslot.find(params[:id])
    respond_to do |format|
      if @timeslot.update(timeslot_params)
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
    @timeslot = Timeslot.find(params[:id])
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Timeslot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:date, :start_time, :end_time, :openings, :pay_amount, :paid_gig, :notes, :venue_id )
  end
end
