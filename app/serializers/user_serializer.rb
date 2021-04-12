class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :age, :bio, :location, :rating, :events
  has_many :favorite_sports
end
