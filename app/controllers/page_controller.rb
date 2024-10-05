class PageController < ApplicationController
  before_action :authenticate_user!
  def home
    following_users = current_user.following.includes(:user).map(&:user)
    @posts = Post.where(user: following_users).includes(:user).order(created_at: :desc)
  end
end
