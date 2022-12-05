class FavoritesController < ApplicationController
  def all_faves
    @favorites = current_user.fav
  end
  def follow
  end

  def add_like
  end

end
