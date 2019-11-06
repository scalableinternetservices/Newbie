class UsersController < ApplicationController
  def show
  	@user = current_user
    @searches = @user.searches
  end
end
