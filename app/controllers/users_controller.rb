class UsersController < ApplicationController
    
    def index 
        users = User.order(:id)
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def new
        user = User.new()
        render json: user
    end

    def create
        user = User.create(user_params)
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    def player_rating
        user = User.find(params[:id])
        user.update_rating(params[:review].to_i)
        render json: user
    end

    def login
        user = User.find_by(firstname: params[:firstname])
        if user.lastname == params[:lastname]
            render json: user
        end
    end

    private

    def user_params
        params.permit(:firstname, :lastname, :age, :bio, :location, :rating)
    end
end
