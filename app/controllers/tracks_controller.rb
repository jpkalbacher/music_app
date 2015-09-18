class TracksController < ApplicationController
  def new
    @track = Track.new
  end

  def create
    @track = Track.create!(track_params)
    redirect_to album_url(params[:track][:album_id])
  end

  def show
    @track = Track.find(params[:id])
  end

  private
  def track_params
    params.require(:track).permit(:name, :track_type, :album_id)
  end
end
