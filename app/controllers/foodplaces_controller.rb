class FoodplacesController < ApplicationController
  before_action :set_foodplace, only: %i[show]

  def index
    if params[:query].present?
      @foodplaces = Foodplace.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @foodplaces = Foodplace.all
      # @markers = @foodplaces.geocoded.map do |foodplace|
      # {
      #   lat: foodplace.latitude,
      #   lng: foodplace.longitude,
      #   info_window: render_to_string(partial: "info_window", locals: { foodplace: foodplace })
      # }
      # end
    end
  end

  def show
    @review = Review.new
    @markers = [
      {
        lat: @foodplace.latitude,
        lng: @foodplace.longitude,
        info_window: render_to_string(partial: "info_window", locals: {foodplace: @foodplace})
      }
    ]
  end

  def map
    @foodplaces = Foodplace.all
      @markers = @foodplaces.geocoded.map do |foodplace|
      {
        lat: foodplace.latitude,
        lng: foodplace.longitude,
        info_window: render_to_string(partial: "info_window", locals: { foodplace: foodplace })
      }
    end
  end

  def map
    @foodplaces = Foodplace.all
    @markers = @foodplaces.geocoded.map do |foodplace|
    {
      lat: foodplace.latitude,
      lng: foodplace.longitude,
      info_window: render_to_string(partial: "info_window", locals: { foodplace: foodplace })
    }
    end
  end

  private

  def set_foodplace
    @foodplace = Foodplace.find(params[:id])
  end

  def foodplace_params
    params.require(:foodplace).permit(:name, :address, :phone_number, :category, :cuisine, :website, :google_rating, :opening_times, :photo)
    # when attaching a photo to foodplace
    # params.require(:foodplace).permit(:name, :photo)
  end
end
