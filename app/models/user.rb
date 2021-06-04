class User < ApplicationRecord
    has_many :user_events, dependent: :destroy
    has_many :events, through: :user_events
    has_many :sports
    has_many :favorite_sports

    # has_many :friend_requests, class_name: 'Friendship', foreign_key: 'friend_two'
    # has_many :pals, through: :friend_requests, source: :added_friend

    # has_many :friends_added, class_name: 'Friendship', foreign_key: 'friend_one'
    # has_many :buddies, through: :friends_added, source: :recieved_request

    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships

    has_many :received_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
    has_many :received_friends, through: :received_friendships, source: 'user'
    
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    
    def update_rating(number)
        new_rating = (self.rating + number) / 2
        self.update(rating: new_rating)
    end

    # def friends 
    #     self.pals + self.buddies
    # end

    def active_friends
        friends.select{ |friend| friend.friends.include?(self) }  
    end
      
    def pending_friends
        friends.select{ |friend| !friend.friends.include?(self) }  
    end
end
