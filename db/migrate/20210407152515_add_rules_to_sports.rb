class AddRulesToSports < ActiveRecord::Migration[6.1]
  def change
    add_column :sports, :rules, :text
  end
end
