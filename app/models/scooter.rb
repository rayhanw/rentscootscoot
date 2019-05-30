class Scooter < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :description, presence: true
  validates :status, presence: true
  validates :location, presence: true
  validates :user, presence: true
  validates :photo, presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :destroy, presence: true
end
