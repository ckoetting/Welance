class AddDeveloperTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :developer_role, :string
  end
end
