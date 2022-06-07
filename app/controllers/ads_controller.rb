class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /ads
  def index
    @ads = Ad.all
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
    @rental = Rental.new
  end

  # GET /ads/:id/edit
  def edit
  end

  # GET /ads/:id
  def update
    @ad.update(ad_params)
    # no need for app/views/restaurants/update.html.erb
    redirect_to ad_path(@ad)
  end

  # DELETE /ads/:id
  def destroy
    @ad.destroy
    # no need for app/views/ads/destroy.html.erb
    redirect_to ads_path
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:title, :location, :color, :cable_length, :brand, :number_of_plug)
  end
end

# def search
# end

# def rates
# end

# def ask
# end

# def filter
# end
