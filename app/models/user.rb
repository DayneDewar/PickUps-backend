class User < ApplicationRecord
    has_many :user_events, dependent: :destroy
    has_many :events, through: :user_events
    has_many :sports
    has_many :favorite_sports

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    validates :firstname, :lastname, :age, presence: true
    
    def update_rating(number)
        new_rating = (self.rating + number) / 2
        self.update(rating: new_rating)
    end

    def friend_requests
        added_me_ids = Friend.where(added_user_id: self.id).map(&:user_id)
        added_users_ids = Friend.where(user_id: self.id).map(&:added_user_id)

        not_accepted = added_me_ids.select{|id| added_users_ids.exclude?(id)}
        User.where(id: not_accepted)
    end

    def accepted_friends
        added_users_ids = Friend.where(user_id: self.id).map(&:added_user_id)
        added_me_users_ids = Friend.where(added_user_id: self.id).map(&:user_id)
    
        matched_ids = added_users_ids.select{|id| added_me_users_ids.include?(id)}
    
        User.where(id: matched_ids)
      end
    
end
