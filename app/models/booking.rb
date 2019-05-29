class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scooter
  has_one :review, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :scooter, presence: true
end
