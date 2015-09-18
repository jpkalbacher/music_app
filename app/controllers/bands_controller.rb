class BandsController < ApplicationController
  before_action :require_user!

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def edit
    @band = Band.find(params[:id])
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
    redirect_to bands_url
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.create!(band_params)
    redirect_to band_url(@band)
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
