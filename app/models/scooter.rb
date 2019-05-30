class Scooter < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  mount_uploader :photo, PhotoUploader
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :description, presence: true, length: { minimum: 10 }
  validates :status, presence: true
  validates :location, presence: true
  validates :user, presence: true
  validates :photo, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
end
