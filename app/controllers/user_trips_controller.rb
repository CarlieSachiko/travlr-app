class UserTripsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    puts "@trip"
    p @trip
    @user_trip = UserTrip.new
    a = UserTrip.where(trip: @trip).pluck(:user_id)
    puts "This is a"
    p a
    @users = User.where("id NOT IN (?)", a) if @trip.invited_users.count > 0
    @users = User.all if @trip.invited_users.count == 0
    @users = @users.to_a
    @users.delete_if {|u| u[:id] == @trip.user_id}
  end

end
