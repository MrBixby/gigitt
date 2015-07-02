class AlbumsController < ApplicationController
  before_filter :authenticate_user!

    def index
      @albums = Album.where(band_id: params[:band_id])
    end

    def show
      @album = Album.find(id: params[:id])
    end

    def new
      @album = Album.new
    end

    def create
      @album = Album.create(album_params)
      respond_to do |format|
        if @album.save
          format.html { redirect_to @album, notice: 'Album was successfully created.' }
          format.json { render :show, status: :created, location: @album }
        else
          format.html { render :new }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @album = Album.find(id: params[:id])
    end

    def update
      @album = Album.find(id: params[:id])
      respond_to do |format|
        if @album.update(album_params)
          format.html { redirect_to @album, notice: 'Album was successfully updated.' }
          format.json { render :show, status: :ok, location: @album }
        else
          format.html { render :edit }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @album.destroy
      respond_to do |format|
        format.html { redirect_to band_albums_url, notice: 'Album was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def album_params
      params.require(:album).permit(:title, :release_year, :comment, :image_url, :songs_attributes => [:title, :comment, :genre, :id, :track])
    end


end
