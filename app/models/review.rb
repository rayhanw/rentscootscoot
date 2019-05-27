class Review < ApplicationRecord
  belongs_to :booking
  validates :booking_id, uniqueness: true, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
