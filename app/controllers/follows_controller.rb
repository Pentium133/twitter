class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow_to(user)
    redirect_to user_path(user), notice: "You are now following #{user.email}."
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow_from(user)
    redirect_to user_path(user), notice: "You have unfollowed #{user.email}."
  end
end
