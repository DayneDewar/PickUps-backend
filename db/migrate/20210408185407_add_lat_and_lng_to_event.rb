class AddLatAndLngToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :lat, :float
    add_column :events, :lng, :float
  end
end
