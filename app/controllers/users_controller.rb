class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	@user = current_user
    @searches = @user.searches
  end
end
