class AccommodationsController < ApplicationController

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  def create
    @city = City.find(params[:city_id])
    @accommodation = Accommodation.new(a_params)
    @accommodation.city = @city
    if @accommodation.save
      redirect_to city_path(@city), Notice: 'Accommodation was successfully added.'
    else
      redirect_to city_path(@city)
    end
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  def update
    @accommodation = Accommodation.find(params[:id])

    if @accommodation.update_attributes(a_params)
      redirect_to accommodation_path(@accommodation), notice: 'Accommodation was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @accommodation = Accommodation.find(params[:id])
    @accommodation.destroy
    redirect_to city_path(@accommodation.city_id), notice: 'Accommodation was successfully deleted.'
  end

  private

    def a_params
      params.require(:accommodation).permit(:name, :address, :note)
    end

end
