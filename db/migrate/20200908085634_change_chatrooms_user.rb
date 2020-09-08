class ChangeChatroomsUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :chatrooms, :developer
    remove_column :chatrooms, :business
    add_column :chatrooms, :developer_id, :integer
    add_column :chatrooms, :business_id, :integer
  end
end
