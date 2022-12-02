class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
   @top_rated_foodplaces = Foodplace.where("google_rating >= 4").limit(10)
  end
  def profile
    @user = User.find(params[:id])
  end
end
