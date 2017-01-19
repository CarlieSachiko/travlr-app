class UserTripsController < ApplicationController

  def create
    @user_trip = UserTrip.new(params.require(:user_trip).permit(:user_id))
    @user_trip.trip_id = params[:trip_id]
    if @user_trip.save
      redirect_to edit_trip_path(params[:trip_id]), notice: 'Traveller was successfully added.'
    else
      redirect_to edit_trip_path(params[:trip_id]), notice: 'Traveller was not added.'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    @user_id = @trip.invited_users.find(params[:user_id])
    @user_trip = UserTrip.where(trip_id: @trip, user_id: @user_id).first
    @user_trip.destroy
    redirect_to trip_path(@trip), notice: 'Traveller was successfully removed.'
  end

end
