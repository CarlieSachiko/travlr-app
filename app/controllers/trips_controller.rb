class TripsController < ApplicationController

  def index
    @trips = Trip.all
    # @trip = Trip.find(params[:id])
    @trip_new = Trip.new
  end

  def show
    @trip = Trip.find(params[:id])
    @creator = User.where(id: @trip.user_id).first
    @invited_users = @trip.invited_users.all
    @day_new = Day.new
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
    # @trip = Trip.find(params[:trip_id])
    @user_trip = UserTrip.new
    a = UserTrip.where(trip: @trip).pluck(:user_id)
    @users = User.where("id NOT IN (?)", a) if @trip.invited_users.count > 0
    @users = User.all if @trip.invited_users.count == 0
    @users = @users.to_a
    @users.delete_if {|u| u[:id] == @trip.user_id}
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(t_params)
      redirect_to @trip, notice: 'Trip was successfully updated.'
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
    params.require(:trip).permit(:name, :country, :startdate, :enddate, :image)
  end

end
