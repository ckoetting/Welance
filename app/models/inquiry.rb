class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  belongs_to :chatroom, optional: true
  has_one :interview
  has_many :reviews, dependent: :destroy
  validates :status, presence: true
  validates :message, presence: true
end
