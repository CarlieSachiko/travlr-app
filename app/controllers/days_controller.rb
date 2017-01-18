class DaysController < ApplicationController

  def create
    @trip = Trip.find(params[:trip_id])
    @day = Day.new(d_params)
    @day.trip = @trip
    if @day.save
      redirect_to trip_path(@trip), Notice: 'Day was successfully added.'
    else
      redirect_to trip_path(@trip)
    end
  end

  private

  def d_params
    params.require(:day).permit(:location, :number, :note, :activity, :accommodation)
  end
end
