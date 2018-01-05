class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://www.ninetyninecats.com'
    user_email = "#{user.username}@example.com"
    mail(to: user_email, subject: 'Welcome to Ninety-Nine Cats!')
  end
end
