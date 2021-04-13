class Event < ApplicationRecord
    has_many :user_events, dependent: :destroy
    has_many :users, through: :user_events

    belongs_to :sport
end
