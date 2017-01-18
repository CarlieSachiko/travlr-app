class UserTripsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @user_trip = UserTrip.new
    a = UserTrip.where(trip: @trip).pluck(:user_id)
    @users = User.where("id NOT IN (?)", a) if @trip.invited_users.count > 0
    @users = User.all if @trip.invited_users.count == 0
    @users = @users.to_a
    @users.delete_if {|u| u[:id] == @trip.user_id}
  end

  def create
    @user_trip = UserTrip.new(params.require(:user_trip).permit(:user_id))
    @user_trip.trip_id = params[:trip_id]
    if @user_trip.save
      redirect_to trip_path(params[:trip_id]), notice: 'Traveller was successfully added.'
    else
      render :new
    end
  end

end
