class InfoController < ApplicationController
  def home
    @venues = Venue.all
  end
end
