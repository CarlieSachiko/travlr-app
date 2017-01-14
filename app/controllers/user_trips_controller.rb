class UserTripsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @user_trip = UserTrip.new


  end

end
