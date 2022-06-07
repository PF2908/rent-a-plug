class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Rating.new(rating_params)
    @user = current_user
    @ad = Ad.find(params[:ad_id])
    @rating.user_id = @user.id
    @rating.ad = @ad
    if @rating.save
      redirect_to ad_path(@ad)
    else
      render ad_path(@ad)
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @ad = Ad.find(@rating.ad_id)
    @rating.delete
    redirect_to ad_path(@ad)
  end

  private

  def rating_params
    params.require(:rating).permit(:user_id, :ad_id, :comment, :rate)
  end
end
