class FoodplacesController < ApplicationController
  before_action :foodplace_params, only: %(show)
  def index
    if params[:query].present?
      @foodplaces = Foodplace.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @foodplaces = Foodplace.all
    end
  end

  def show
  end

  private

  def foodplace_params
    @foodplace = Foodplace.find(params[:id])
  end
end
