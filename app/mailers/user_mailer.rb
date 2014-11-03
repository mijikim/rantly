class UserMailer < ActionMailer::Base
  default from: "miji.kim926@gmail.com"

  def confirmation_email(user)
    @url = Rails.env.production? ? 'http://frozen-atoll-7546.herokuapp.com/' : 'http://localhost:3000'
    @user = user
    @session = "http://rant.ly/sessions/new"
    mail(to: @user.email, subject: "Activate your Rantly account")
  end
end
