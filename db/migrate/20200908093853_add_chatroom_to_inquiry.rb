class AddChatroomToInquiry < ActiveRecord::Migration[6.0]
  def change
    add_column :inquiries, :chat?, :boolean, default: false
  end
end
