class FavoriteSportsController < ApplicationController
    
    def index
        favorites = FavoriteSport.order(:id)
        render json: favorites
    end

    def show
        favorite = FavoriteSport.find(params[:id])
        render json: favorite
    end

    def create
        favorite = FavoriteSport.create(favorite_params)
        render json: favorite_params
    end

    def destroy
        favorite = FavoriteSport.find(params[:id])
        favorite.destroy
    end

    private

    def favorite_params
        params.permit(:user_id, :sport_id)
    end

end
