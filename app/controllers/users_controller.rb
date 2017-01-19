class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @city = City.new
    # @current_city = City.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params.require(:user).permit(:name, :email, :hometown, :image, :banner))
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
