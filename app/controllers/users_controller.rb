class UsersController < ApplicationController
    before_action :authorize
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def home
    end

    def index
      @users = User.all
    end

    # def new
    #   @user = User.new
    # end

    # def create
    #   user = User.create(user_params)
    #   redirect_to user_path(user)
    # end

    def show
    end

    def edit
    end

    def update
      @user.update(user_params)
      redirect_to user_path(@user)
    end

    def destroy
      # @user.renter_reservations.each do |res|
      #   res.delete
      # end
      # @user.host_reservations.each do |res|
      #   res.delete
      # end
      # @user.host_venues.each do |ven|
      #   ven.delete
      # end
      # @user

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
