class RemoveRulesFromSports < ActiveRecord::Migration[6.1]
  def change
    remove_column :sports, :rules, :string
  end
end
