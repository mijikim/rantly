class Rant < ActiveRecord::Base
  belongs_to :user
  has_many :favorited_rants, dependent: :destroy
  has_many :comments, as: :commentable


  validates_presence_of :category
  validates :rant, length: { minimum: 140 }
  validates :category, length:  { maximum: 50}

  default_scope { where(spam: false)}

  def user_first_name
    user.first_name.capitalize
  end


end