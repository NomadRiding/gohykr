class User < ApplicationRecord
  validates :password_digest, presence: true, length: { minimum: 3, maximum: 15 },
  uniqueness: { case_sensitive: false }  
  has_secure_password


end
