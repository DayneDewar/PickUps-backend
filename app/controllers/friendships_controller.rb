class FriendshipsController < ApplicationController
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
        params.permit(:friend_one, :friend_two)
    end
end
