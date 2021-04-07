class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :location
      t.string :time
      t.boolean :equipment

      t.timestamps
    end
  end
end
