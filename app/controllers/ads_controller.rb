class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :create]


  # GET /ads
  def index
    if user_signed_in?
      @my_ads = Ad.where(user_id: current_user)
      @other_ads = Ad.where.not(user_id: current_user)
    end
    @ads = Ad.all
    @sum = []
    @ads.each do |ad|
      @ratings = Rating.where(ad_id: ad.id)
      @ratings.each do |rating|
        @sum << rating.rate
      end
    end
    if @sum.length != 0
      @average = @sum.sum / @sum.length
    else
      @average = 0
    end

    if params[:query].present?
      if user_signed_in?
        @other_ads = Ad.global_search(params[:query])
      end
      @ads = Ad.global_search(params[:query])
    else
      @ads = Ad.all
    end
  end

  # GET /ads/new
  def new
    @ad = Ad.new
    @ad.user_id = current_user.id
  end

  # POST /ads
  def create
    @ad = Ad.new(ad_params)
    @user = current_user
    @ad.user_id = @user.id
    if @ad.save
      redirect_to @ad, notice: 'ad created.'
    else
      render :new
    end
  end

  # GET /ads/1
  def show
    @rating = Rating.new
    @rating.ad_id = params[:id]
    @user = current_user
    @sum = []
    @ratings = Rating.where(ad_id: @ad.id)
    if user_signed_in?
    @rentals = Rental.where(ad_id: @ad.id, user_id: current_user)
    end
    if @rentals != nil
      @ad_rental = @rentals.last
    end
    @ratings.each do |rating|
      @user_rating = User.find(rating.user_id)
      @sum << rating.rate
    end
    if @sum.length != 0
      @average = @sum.sum / @sum.length
    else
      @average = 0
    end
    @rental = Rental.new

    @marker = {
      lat: @ad.latitude,
      lng: @ad.longitude,
      info_window: render_to_string(partial: "info_window", locals: { ad: @ad })
    }
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
    params.require(:ad).permit(:title, :location, :color, :cable_length, :brand, :number_of_plug, :usb, :description, :price, :photo)
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
