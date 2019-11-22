class RelationshipsController < ApplicationController

    def create
        user = User.find(params[:followed_id])
        current_user.follow(user)
        # arrange RelationshipsController to respond to Ajax requests
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
        redirect_to user
    end

    def destroy
        user = Relationship.find(params[:id]).followed
        current_user.unfollow(user)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
        redirect_to user
    end


end
