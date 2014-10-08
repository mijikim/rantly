class User < ActiveRecord::Base
  has_secure_password
  has_many :rants
  has_attached_file :avatar, styles: { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => ActionController::Base.helpers.asset_path('assets/:style/missing.png')

  validates_attachment :avatar, presence: true, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  validates_presence_of :username, :bio, :rant_frequency
  validates_uniqueness_of :username
  validates :password, length: { in: 8..15 }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :bio, length: { maximum: 400,
  too_long: "%{count} characters is the maximum allowed" }

end