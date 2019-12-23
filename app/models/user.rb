class User < ApplicationRecord
  has_secure_password

  has_many :locations

  validates :username, uniqueness: { case_sensitive: false }
end
