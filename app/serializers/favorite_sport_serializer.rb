class FavoriteSportSerializer < ActiveModel::Serializer
  attributes :id, :sport

  belongs_to :user
end
