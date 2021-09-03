class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :age, :bio, :location, :rating, :events, :friend_requests, :accepted_friends
  has_many :favorite_sports
end
