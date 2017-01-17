class ActivitiesController < ApplicationController

  def create
    @city = City.find(params[:city_id])
    @activity = Activity.new(a_params)
    @activity.city = @city
    if @activity.save
      redirect_to city_path(@city), Notice: 'Activity successfully added.'
    else
      redirect_to city_path(@city)
    end
  end

  private

    def a_params
      params.require(:activity).permit(:name, :note)
    end

end
