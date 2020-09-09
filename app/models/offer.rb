class Offer < ApplicationRecord
  belongs_to :user
  has_many :inquiries
  has_many :chatrooms
  has_many_attached :photos
  validates :title, presence: true
  validates :description, presence: true
  validates :skills_required, presence: true
  validates :compensation, presence: true
  validates :fixed_price, presence: true
  validates :location, presence: true
  validates :deadline_at, presence: true
  geocoded_by :location
  after_validation :geocode
  include PgSearch::Model
  pg_search_scope :search_by_title_and_location,
    against: [ :title, :location ],
    associated_against: {
      user: [ :business_name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
