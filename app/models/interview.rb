class Interview < ApplicationRecord
  belongs_to :inquiry
  belongs_to :user
end
