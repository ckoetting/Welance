class AddUsersToChatRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :developer, :integer
    add_column :chatrooms, :business, :integer
  end
end
