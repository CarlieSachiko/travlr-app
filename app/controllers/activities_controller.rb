class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
  end

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

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])

    if @activity.update_attributes(a_params)
      redirect_to activity_path(@activity), notice: 'Activity was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to city_path(@activity.city_id), notice: 'Activity was successfully deleted.'
  end

  private

    def a_params
      params.require(:activity).permit(:name, :note)
    end

end
