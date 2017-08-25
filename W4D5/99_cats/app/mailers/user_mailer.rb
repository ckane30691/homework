class UserMailer < ApplicationMailer
  default from: "me@I_got_99_problems_but_a_cat_aint_one.org"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/session/new'
    mail(to: user.username, subject: 'Welcome to 99 Cats')
  end
end
