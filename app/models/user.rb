class User < ActiveRecord::Base
  has_secure_password
  has_many :rants

  validates_presence_of :username, :first_name, :last_name, :bio, :rant_frequency
  validates_uniqueness_of :username
  validates :password, length: { in: 8..15 }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :bio, length: { maximum: 400,
  too_long: "%{count} characters is the maximum allowed" }

end