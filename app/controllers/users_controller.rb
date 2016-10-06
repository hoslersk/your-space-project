class UsersController < ApplicationController
    before_action :authorize
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def home
    end

    def index
      @users = User.all
    end

    def show
    end

    def edit
    end

    def update
      @user.update(user_params)
      if @user.errors.any?
        redirect_to user_path(@user), notice: @user.errors.full_messages.join(". ")
      else
        redirect_to user_path(@user)
      end
    end

    def destroy
      @user.renter_reservations.each do |res|
        res.destroy
      end
      @user.host_reservations.each do |res|
        res.destroy
      end
      @user.host_venues.each do |ven|
        ven.destroy
      end
      @user.host_listings.each do |list|
        list.destroy
      end
      @user.destroy
      redirect_to users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end

end
