class Review < ApplicationRecord
  belongs_to :inquiry
  validates :rating, presence: true
  validates :description, presence: true
end
