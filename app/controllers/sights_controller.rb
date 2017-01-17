class SightsController < ApplicationController
  def create
    @city = City.find(params[:city_id])
    @sight = Sight.new(a_params)
    @sight.city = @city
    if @sight.save
      redirect_to city_path(@city), Notice: 'Sight successfully added.'
    else
      redirect_to city_path(@city)
    end
  end

  private

    def a_params
      params.require(:sight).permit(:name, :address, :note)
    end
end
