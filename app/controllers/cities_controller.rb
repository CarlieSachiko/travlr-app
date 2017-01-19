class CitiesController < ApplicationController

  def index
    @city = City.all
    @user = current_user
    @city_new = City.new
  end

  def show
    @city = City.find(params[:id])
    @accommodation_new = Accommodation.new
    @activity_new = Activity.new
    @sight_new = Sight.new
    @eatery_new = Eatery.new
  end

  def update
    @city = City.find(params[:id])
    if @city.update_attributes(c_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      redirect_to @city
    end
  end

  def create
    @user = User.find(params[:user_id])
    @city = City.new(c_params)
    @city.user = @user
    if @city.save
      redirect_to user_cities_path(current_user), notice: 'Destination was successfully added.'
    else
      redirect_to user_cities_path(current_user)
    end
  end


  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to user_cities_path(current_user), notice: 'City was successfully deleted.'
  end

  private

  def c_params
    params.require(:city).permit(:name, :country)
  end


end
