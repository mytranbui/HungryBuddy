class FollowersController < ApplicationController
  def follow
    current_user.follow(User.find(params[:user]))
    # current_user.followees << @user
    redirect_to users_path
  end

  # def unfollow
  #   current_user.stop_following(params[:user])
  #   current_user.followed_users.find_by(followee_id: @user.id).destroy

  # end

  def follow_count
  end
end
