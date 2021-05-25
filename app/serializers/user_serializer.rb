class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :firstname, :lastname, :age, :bio, :location, :rating, :events, :friends
  has_many :favorite_sports
end
