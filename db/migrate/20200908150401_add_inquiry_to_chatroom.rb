class AddInquiryToChatroom < ActiveRecord::Migration[6.0]
  def change
    remove_reference :chatrooms, :offer
    add_reference :inquiries, :chatroom, foreign_key: true, index: true
  end
end
