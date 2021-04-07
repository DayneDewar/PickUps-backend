class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :bio, :location, :rating
end
