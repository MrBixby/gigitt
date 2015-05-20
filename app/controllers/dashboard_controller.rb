class DashboardController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]

  def dashboard
    if current_user.role == "venue"
      set_venue_dash
      render "venue_dashboard"
    elsif current_user.role == "musician"
      set_band_dash
      render "band_dashboard"
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

    def set_fan_dash
      @fan = current_user.fan
    end
end
