class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  belongs_to :chatroom
  has_many :reviews, dependent: :destroy
  validates :status, presence: true
  validates :message, presence: true
end
