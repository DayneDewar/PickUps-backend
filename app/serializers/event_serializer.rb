class EventSerializer < ActiveModel::Serializer
  attributes :id, :location, :equipment, :sport_id, :date, :time, :lat, :lng

  belongs_to :users
end
