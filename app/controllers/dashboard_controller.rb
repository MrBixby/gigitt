class DashboardController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]

  def dashboard
    if current_user.role == "venue"
      set_venue_dash
      render "venue_dashboard"
    elsif current_user.role == "musician"
      set_band_dash
      if @band.nil?
        redirect_to new_band_path
      else
        set_band_session
        set_booked_gig
        set_applied_gig
        render "band_dashboard"
      end
    else
      set_fan_dash
      render "fan_dashboard"
    end
  end

  def settings
  end

  private
    def set_venue_dash
      @venue = current_user.venues.first
    end

    def  set_band_dash
      @band = current_user.bands.first
    end

    def set_band_session
      session[:current_band_id] ||= @band.id
      @openings = @band.available_gigs
    end

    def set_booked_gig
      @booked = current_band.booked_gigs
    end

    def set_applied_gig
      @applied = current_band.applied_gigs
    end

    def set_fan_dash
      @fan = current_user.fan
    end
end
