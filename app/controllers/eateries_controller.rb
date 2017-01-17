class EateriesController < ApplicationController
  def create
    @city = City.find(params[:city_id])
    @eatery = Eatery.new(a_params)
    @eatery.city = @city
    if @eatery.save
      redirect_to city_path(@city), Notice: 'Eatery successfully added.'
    else
      redirect_to city_path(@city)
    end
  end

  private

    def a_params
      params.require(:eatery).permit(:name, :address, :note)
    end
end
