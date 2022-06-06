class AdsController < ApplicationController
  before_action :set_ad, only: [:show]

  # GET /ads
  def index
    @ads = Ad.all
  end

  # GET /query=params
  def search
  end

  # GET /ads/new
  def new
    @ad = Ad.new
  end

  # POST /ads
  def create
    @ad = Ad.new(ad_params)

    if @ad.save
      redirect_to @ad, notice: 'ad created.'
    else
      render :new
    end
  end

  # GET /ads/1
  def show
    @ad = Ad.find(params[:id])
  end

  def rates
  end

  def ask
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    @ad.update(params[:ad])
  end

  private

  def set_ad
    @ad = ad.find(params[:id])
  end

  # def ad_params
  #   params.require(:ad).permit(:title)
  # end
end
