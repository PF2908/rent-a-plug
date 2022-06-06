class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    @ad = Ad.find(params[:ad_id])
    @rental = Rental.new(rental_params)
    @rental.ad = @ad
    if @rental.save
      redirect_to ad_path(@ad)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
