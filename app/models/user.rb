class User < ActiveRecord::Base
  # attr_accessor :activation_token
  before_create :create_activation_token

  has_secure_password

  has_many :rants, dependent: :destroy
  has_many :favorited_rants, dependent: :destroy
  has_many :comments, as: :commentable

  has_many :followed_user_relationships, foreign_key: :follower_id, class_name: 'UserRelationship'
  has_many :followed_users, through: :followed_user_relationships

  has_many :follower_relationships, foreign_key: :followed_user_id, class_name: 'UserRelationship'
  has_many :followers, through: :follower_relationships

  has_attached_file :avatar, styles: {:medium => "300x300>", :thumb => "100x100>"},
                    :default_url => ActionController::Base.helpers.asset_path('assets/:style/missing.png')

  validates_attachment :avatar, presence: true, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]}

  validates_presence_of :username, :bio, :rant_frequency, :email
  validates_uniqueness_of :username, :email
  validates :email, email: true
  validates :password, length: {in: 8..15}, on: :create
  validates :first_name, :last_name, length: {minimum: 2}
  validates :bio, length: {maximum: 400,
                           too_long: "%{count} characters is the maximum allowed"}

  def follow_user(user)
    followed_users << user
  end

  def unfollow_user(user)
    followed_users.delete(user)
  end

  def following?(user_id)
    followed_users.ids.include?(user_id)
  end

  def all_favorite_rants
    favorited_rants.order(created_at: :desc).pluck(:rant_id).map { |id| Rant.find(id) }
  end

  def favorite_rant(rant_id)
    favorited_rants.build(rant_id: rant_id).save
  end

  def favorited?(rant_id)
    favorited_rants.pluck(:rant_id).include?(rant_id)
  end

  def self.search(search_term)
    joins(:rants).where(
      'username ILIKE ? OR first_name ILIKE ?' +
        'OR last_name ILIKE ? OR rants.rant ILIKE ?' +
        'OR rants.category ILIKE ?',
      search_term,
      search_term,
      search_term,
      "%#{search_term}%",
      "%#{search_term}%"
    )
  end

  def authenticated?(token)
    self.activation_token == token
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  private

  def create_activation_token
    self.activation_token  = User.new_token
  end

end