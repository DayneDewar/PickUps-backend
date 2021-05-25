class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :friend_one, :friend_two
end
