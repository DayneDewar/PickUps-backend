require "rest-client"
class EventsController < ApplicationController
    def index
        events = Event.order(:id)
        render json: events
    end

    def show
        event = Event.find(params[:id])
        render json: event
    end

    def update
        maps = ENV["GOOGLE_API_KEY"]
        response = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:location]}&key=#{maps}"
        latitude = JSON.parse(response)["results"][0]["geometry"]["location"]["lat"]
        longitude = JSON.parse(response)["results"][0]["geometry"]["location"]["lng"]
        event = Event.find(params[:id])
        event.lat = latitude
        event.lng = longitude
        event.update(event_params)
        render json: event
    end

    def create
        maps = ENV["GOOGLE_API_KEY"]
        response = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:location]}&key=#{maps}"
        latitude = JSON.parse(response)["results"][0]["geometry"]["location"]["lat"]
        longitude = JSON.parse(response)["results"][0]["geometry"]["location"]["lng"]
        event = Event.new(event_params)
        event.lat = latitude
        event.lng = longitude
        event.save
        event.new_game(params[:user_id])
        render json: event
    end

    def destroy
        event = Event.find(params[:id])
        event.destroy
        render json: event
    end

    private 

    def event_params
        params.permit(:location, :equipment, :datetime, :sport_id, :lat, :lng)
    end

end
