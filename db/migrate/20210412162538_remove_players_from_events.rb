class RemovePlayersFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :players, :integer
  end
end
