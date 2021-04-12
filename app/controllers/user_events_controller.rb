class UserEventsController < ApplicationController
    def index
        user_events = UserEvent.order(:id)
        render json: user_events
    end

    def show
        user_event = UserEvent.find(params[:id])
        render json: user_event
    end

    def create
        user_event = UserEvent.create(user_events_params)
        render json: user_event
    end

    def cancel
        user_event = UserEvent.find_by(user_id: params[:user_id], event_id: params[:event_id])
        user_event.destroy
        render json: user_event
    end


    private 

    def user_events_params
        params.permit(:user_id, :event_id)
    end

end
