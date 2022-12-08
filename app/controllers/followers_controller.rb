class FollowersController < ApplicationController
  def follow
    @user = User.find(params[:id])
    @user.follow(User.find(params[:user]))
    # current_user.followees << @user
    redirect_to users_path
  end



  def unfollow
    @user = User.find(params[:id])
    @user.stop_following(User.find(params[:user]))
    # current_user.followees << @user
    redirect_to users_path
  end
end
