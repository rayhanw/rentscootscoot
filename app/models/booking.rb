class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scooter
  has_one :review
  validates :price, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
