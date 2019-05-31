class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :scooter
  has_one :review, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true
  validates :scooter, presence: true
  validate :not_blank_date

  after_create :change_scooter_status
  after_destroy :change_back_scooter_status

  private

  def not_blank_date
    if !start_date.nil? && !end_date.nil?
      errors.add(:start_date, "can't be in the past") if start_date.to_date < Date.today
      errors.add(:start_date, "can't be after the end date") if start_date.to_date > end_date
    end
  end

  def change_scooter_status
    scooter = Scooter.find(scooter_id)
    scooter.status = 'Unavailable'
    scooter.save
  end

  def change_back_scooter_status
    scooter = Scooter.find(scooter_id)
    scooter.status = 'Available'
    scooter.save
  end
end
