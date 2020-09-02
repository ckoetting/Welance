class AddMoreFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :user_type, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :dob, :date
    add_column :users, :phone_number, :string
    add_column :users, :hourly_rate, :integer
    add_column :users, :headline, :string
  end
end
