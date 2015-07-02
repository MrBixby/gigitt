class SongsController < ApplicationController
  before_filter :authenticate_user!

    def index
      @songs = Song.where(band_id: params[:band_id]).group(:album)
    end

    def show
    end

    def new
      @song = Song.new
    end

    def create

    end

    def edit
    end

    def update

    end

    def destroy

    end

    private

    def song_params
    end


end
