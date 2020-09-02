class Offer < ApplicationRecord
  belongs_to :user
  has_many :inquiries
  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true
  validates :skills_required, presence: true
  validates :compensation, presence: true
  validates :fixed_price, presence: true
  validates :location, presence: true
  validates :deadline_at, presence: true
end
