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

    def create
        maps = ENV["GOOGLE_API_KEY"]
        response = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json?address=#{params[:location]}&key=#{maps}"
        latitude = JSON.parse(response)["results"][0]["geometry"]["location"]["lat"]
        longitude = JSON.parse(response)["results"][0]["geometry"]["location"]["lng"]
        event = Event.new(event_params)
        event.lat = latitude
        event.lng = longitude
        event.save
        render json: event
    end

    private 

    def event_params
        params.permit(:location, :equipment, :sport_id, :lat, :lng)
    end

end
