class Friendship < ApplicationRecord
    belongs_to :added_friend, class_name: 'User', foreign_key: 'friend_one'
    belongs_to :recieved_request, class_name: 'User', foreign_key: 'friend_two'
end
