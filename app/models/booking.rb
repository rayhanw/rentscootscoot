class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scooter
  has_one :review
end
