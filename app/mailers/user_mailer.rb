class UserMailer < ActionMailer::Base
  default from: "miji.kim926@gmail.com"

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: "Activate your Rantly account")
  end

  def new_rant_email(rant, follower)
    @rant = rant
    mail(to: follower.email, subject: "#{@rant.user.username.capitalize} has posted a new rant!")
  end

end
