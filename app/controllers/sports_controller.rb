class SportsController < ApplicationController
    
    def index 
        sports = Sport.order(:id)
        render json: sports
    end

    def show
        sport = Sport.find(params[:id])
        render json: sport
    end

    def new
        sport = Sport.new()
        render json: sport
    end

    def create
        sport = Sport.create(sport_params)
        render json: sport
    end

    def update
        sport = Sport.find(params[:id])
        sport.update(sport_params)
        render json: sport
    end

    def destroy
        sport = Sport.find(params[:id])
        sport.destroy
        render json: sport
    end

    private

    def sport_params
        params.permit(:name, :equipment, :image, :rules, :user_id)
    end
end
