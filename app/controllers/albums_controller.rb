class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
    @bands = Band.all
  end

  def create
    @album = Album.create!(album_params)
    redirect_to band_url(params[:album][:band_id])
  end

  private
  def album_params
    params.require(:album).permit(:name, :band_id, :recording_type)
  end

end
