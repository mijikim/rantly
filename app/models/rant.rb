class Rant < ActiveRecord::Base
  belongs_to :user
  has_many :favorited_rants, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy


  validates_presence_of :category
  validates :rant, length: { minimum: 140 }
  validates :category, length:  { maximum: 50}

  default_scope { where(spam: false) }

  def user_first_name
    user.first_name.capitalize
  end

  def self.search_mentioned(username)
    where("rant LIKE ? AND SPAM <> true",  "%@#{username}%")
  end

  def self.latest_rants(id)
    order(created_at: :desc).where("user_id != #{id}")
  end

  def self.search_hashtag(term)
    where("rant ILIKE ?", "%#{term}%")
  end

end