class AddDefaultValueToStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :inquiries, :status, :string, :default => "pending"
  end
end
