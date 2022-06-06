class UsersController < ApplicationController
    before_action :set_flat, only: [:show, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to ads_path
        else
            render :new
        end
    end

    def show
    end

    def edit
    end
  
    def update
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  
    def destroy
      @user.destroy
      redirect_to ads_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
    end
end
