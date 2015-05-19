class DashboardController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]

  def dashboard
    if current_user.role == "venue"
      @venue = current_user.venues.first
      render "venue_dashboard"
    elsif current_user.role == "musician"
      @band = current_user.bands.first
      render "band_dashboard"
    else
      @fan = current_user.fan
      render "fan_dashboard"
    end
  end

  def settings
  end
end
