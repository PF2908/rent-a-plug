class RentalsController < ApplicationController
  #before_action :authenticate_user!
  def new
    @rental = Rental.new
  end

  def create
    @ad = Ad.find(params[:ad_id])
    @rental = Rental.new(rental_params)
    @rental.ad = @ad
    @rental.user = current_user
    if @rental.save
      redirect_to ad_rental_path(@ad, @rental)
    else
      render :new
    end
  end

  def show
    @ad = Ad.find(params[:ad_id])
    @rental = Rental.find(params[:id])
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :user_id, :ad_id)
  end
end
