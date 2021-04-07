class AddPlayersToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :players, :integer
  end
end
