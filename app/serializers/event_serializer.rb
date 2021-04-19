class EventSerializer < ActiveModel::Serializer
  attributes :id, :location, :equipment, :sport_id, :lat, :lng, :datetime

  belongs_to :users
  belongs_to :sport
end
