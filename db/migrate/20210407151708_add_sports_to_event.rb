class AddSportsToEvent < ActiveRecord::Migration[6.1]
  def change
    add_reference :events, :sport, null: false, foreign_key: true
  end
end
