class UsersController < ApplicationController
  def show
  	# @user = current_user
    @user = User.find(params[:id])
    @searches = @user.searches
  end

  def following
      @title = "Following"
      @user = User.find(params[:id])
      @users = @user.following.paginate(page: params[:page], per_page: 10)
      render 'show_follow'
  end

  def followers
      @title = "Followers"
      @user = User.find(params[:id])
      @users = @user.followers.paginate(page: params[:page], per_page: 10)
      render 'show_follow'
  end

  private
end
