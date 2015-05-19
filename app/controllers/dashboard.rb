class DashboardController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]

  def dashboard
    if current_user.role == “venue”
      @venue = current_user.venue.first
      render venue_dashboard_path
    elseif current_user.role == “musician”
      @band = current_user.band.first
      render band_dashboard_path
    else
      @fan = current_user.fan
      render fan_dashboard_path
    end
  end

  def settings
  end
end
