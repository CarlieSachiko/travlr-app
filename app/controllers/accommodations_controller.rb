class AccommodationsController < ApplicationController
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

  private

    def a_params
      params.require(:accommodation).permit(:name, :address, :note)
    end

end
