class Review < ApplicationRecord
  belongs_to :booking
  validates :booking_id, uniqueness: true
end
