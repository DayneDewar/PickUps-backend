class EventSerializer < ActiveModel::Serializer
  attributes :id, :location, :equipment, :players, :sport_id, :date, :time, :lat, :lng
end
