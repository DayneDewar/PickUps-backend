class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.integer :friend_one
      t.integer :friend_two

      t.timestamps
    end
  end
end
