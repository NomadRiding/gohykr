class Itinerary < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar_image
  has_many :locations
  has_many :attendees
  has_many :events,
            foreign_key: 'user_id',
            class_name: 'Itinerary',
            through: :attendees
end
