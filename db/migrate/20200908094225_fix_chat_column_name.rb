class FixChatColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :inquiries, :chat?, :chat
  end
end
