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

  def edit
    @day = Day.find(params[:id])
    @trip = Trip.where(id: @day.trip_id).first
  end

  def update
    @day = Day.find(params[:id])

    if @day.update_attributes(d_params)
      redirect_to trip_path(@day.trip_id), notice: 'Day was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @day = Day.find(params[:id])
    @day.destroy
    redirect_to trip_path(@day.trip_id), notice: 'Day was successfully deleted.'
  end

  private

  def d_params
    params.require(:day).permit(:location, :number, :note, :activity, :accommodation, :date)
  end
end
