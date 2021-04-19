class Event < ApplicationRecord
    has_many :user_events, dependent: :create, dependent: :destroy
    has_many :users, through: :user_events

    belongs_to :sport

    def new_game(user_id)
        @user_event = UserEvent.create(user_id: user_id, event: self)
    end
end
