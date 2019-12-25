class User < ApplicationRecord
  has_secure_password

  has_many :locations

  validates :username, uniqueness: { case_sensitive: false }
  validates :display_name, :username, presence: true
  validates :username, :display_name, length: { in: 6..20 }
end
