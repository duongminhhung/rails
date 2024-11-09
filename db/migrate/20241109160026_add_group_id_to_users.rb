class AddGroupIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :group_id, :integer, null: false
    add_index :users, :group_id
  end
end
