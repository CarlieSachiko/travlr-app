class EateriesController < ApplicationController

  def show
    @eatery = Eatery.find(params[:id])
  end

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

  def edit
    @eatery = Eatery.find(params[:id])
  end

  def update
    @eatery = Eatery.find(params[:id])

    if @eatery.update_attributes(a_params)
      redirect_to eatery_path(@eatery), notice: 'Eatery was sucessfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @eatery = Eatery.find(params[:id])
    @eatery.destroy
    redirect_to city_path(@eatery.city_id), notice: 'Eatery was successfully deleted.'
  end

  private

    def a_params
      params.require(:eatery).permit(:name, :address, :note)
    end
end
