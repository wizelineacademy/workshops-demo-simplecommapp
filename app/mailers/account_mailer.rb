class AccountMailer < ApplicationMailer
  def welcome(user)
    @user = user
    subject = "Welcome to our portal!"
    mail(to: @user.email, subject: subject)
  end
end
