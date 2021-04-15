class User < ApplicationRecord
    has_many :user_events, dependent: :destroy
    has_many :events, through: :user_events
    has_many :sports
    has_many :favorite_sports

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    
    def update_rating(number)
        new_rating = (self.rating + number) / 2
        self.update(rating: new_rating)
    end


end
