class UserMailer < ActionMailer::Base
  default from: "miji.kim926@gmail.com"

  def confirmation_email(user)
    @user = user
    @url = "http://rant.ly/sessions/new"
    mail(to: @user.email, subject: "Activate your Rantly account")
  end
end
