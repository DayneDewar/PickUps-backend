class SportSerializer < ActiveModel::Serializer
  attributes :id, :name, :equipment, :image, :rules
end
