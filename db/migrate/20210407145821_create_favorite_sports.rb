class CreateFavoriteSports < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_sports do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
