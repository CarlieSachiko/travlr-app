class TripsController < ApplicationController

  def index
    @trips = Trip.all
    # @trip = Trip.find(params[:id])
    @new_trip = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])

  end

  # def new
  #   @trip = Trip.new
  # end

  def new_trip
  respond_to do |format|
    format.html
    format.js
  end
end

  def create
    @user = User.find(current_user.id)
    @trip = Trip.new(t_params)
    @trip.user = @user
    if @trip.save
      redirect_to trips_path(current_user), notice: 'Trip was successfully created.'
    else
      redirect_to trips_path(current_user)
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(t_params)
      redirect_to @trip, notice: 'Trip was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path(current_user), notice: 'Trip was successfully deleted.'
  end

  private

  def t_params
    params.require(:trip).permit(:name, :startdate, :enddate)
  end

end
