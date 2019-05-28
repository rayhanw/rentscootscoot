class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :scooters
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
