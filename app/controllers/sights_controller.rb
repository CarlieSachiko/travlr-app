class SightsController < ApplicationController

  def show
    @sight = Sight.find(params[:id])
  end

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

  def edit
    @sight = Sight.find(params[:id])
  end

  def update
    @sight = Sight.find(params[:id])

    if @sight.update_attributes(a_params)
      redirect_to sight_path(@sight), notice: 'Sight was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sight = Sight.find(params[:id])
    @sight.destroy
    redirect_to city_path(@sight.city_id), notice: 'Sight was successfully deleted.'
  end

  private

    def a_params
      params.require(:sight).permit(:name, :address, :note)
    end
end
