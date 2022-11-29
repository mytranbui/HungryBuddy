class FoodplacesController < ApplicationController
  before_action :foodplace_params, only: %(show)
  def index
    @foodplaces = Foodplace.all
  end

  def show
  end

  private

  def foodplace_params
    @foodplace = Foodplace.find(params[:id])
  end
end
