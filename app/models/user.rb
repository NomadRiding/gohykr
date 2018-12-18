class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar_image
  has_many :itineraries
end
