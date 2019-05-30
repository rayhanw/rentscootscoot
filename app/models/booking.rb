class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scooter
  has_one :review, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :scooter, presence: true
  validate :not_blank_date

  def not_blank_date
    if !start_date.nil? && !end_date.nil?
      errors.add(:start_date, "can't be in the past") if start_date.to_date < Date.today
      errors.add(:start_date, "can't be after the end date") if start_date.to_date > end_date
      # raise
    end
  end
end
