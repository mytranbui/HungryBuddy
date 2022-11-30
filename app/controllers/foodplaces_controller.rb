class FoodplacesController < ApplicationController
  before_action :set_foodplace, only: %i[show]

  def index
    @foodplaces = Foodplace.all
  end

  def show
  end

  private

  def set_foodplace
    @foodplace = Foodplace.find(params[:id])
  end

  def foodplace_params
    params.require(:foodplace).permit(:name, :address, :phone_number, :category, :cuisine, :website, :google_rating, :opening_times)
    # when attaching a photo to foodplace
    # params.require(:foodplace).permit(:name, :photo)
  end
end
