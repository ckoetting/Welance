class AddOfferToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :offer, foreign_key: true
  end
end
