class DashboardController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]

  def dashboard
    if current_user == fan
      @fan_dashboard = fanstuff
    elseif current_user == band
      @band_dashboard = bandstuff
    else
     @venue_dashboard = venuestuff
    end
  end

  def settings
  end
