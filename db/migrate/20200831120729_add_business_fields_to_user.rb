class AddBusinessFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :business_address, :string
    add_column :users, :business_name, :string
    add_column :users, :business_vat_id, :string
    add_column :users, :business_size, :string
  end
end
