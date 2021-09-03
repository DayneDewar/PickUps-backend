class FriendsController < ApplicationController
    def add_friend
        new_friend = Friend.create(friends_params)
        render json: new_friend
    end

    def decline_friend
        request = Friend.where(friends_params)
        request.destroy
        render json: request
    end

    private 

    def friends_params
        params.permit(:user_id, :added_user_id)
    end
end
