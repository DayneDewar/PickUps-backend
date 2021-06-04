class FriendshipsController < ApplicationController
    def index
        friends = Friendship.order(:id)
        render json: friends
    end
    def create
        friend = Friendship.create(friends_params)
        render json: friend
    end

    def destroy
        friend = Friendship.find(params[:id])
        friend.destroy
        render json: friend
    end
    
    private

    def friends_params
        params.permit(:user_id, :friend_id)
    end
end
