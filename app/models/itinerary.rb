class Itinerary < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar_image
  has_many :locations

end
