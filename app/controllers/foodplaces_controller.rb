class FoodplacesController < ApplicationController
  before_action :set_foodplace, only: %(show)
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
  end
end
