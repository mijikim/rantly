class Rant < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :category
  validates :rant, length: { minimum: 140 }
  validates :category, length:  { maximum: 50}

  def user_first_name
    user.first_name.capitalize
  end

end