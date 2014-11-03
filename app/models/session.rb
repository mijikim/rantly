class Session
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attr_accessor :username, :password

  validates :username, :password, presence: true
  validate 'user_found?'

  def initialize(params={})
    @username = params.fetch(:username)
    @password = params.fetch(:password)
  end

  def user_found?
    user = User.find_by(username: username)
    unless username == "" || password == ""
      unless user&&user.authenticate(password)
      errors.add(:base, "Login Failed")
      end
    end
  end

  def user_activated?
    User.find_by(username: username).activated
  end


  def user_id
    User.find_by(username: username).id
  end

end

