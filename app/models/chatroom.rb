class Chatroom < ApplicationRecord
  has_many :messages
  has_one :inquiry
  belongs_to :user, class_name: 'User', foreign_key: 'developer_id'
  belongs_to :user, class_name: 'User', foreign_key: 'business_id'
end
