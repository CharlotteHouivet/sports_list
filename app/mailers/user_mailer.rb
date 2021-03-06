# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'contact.sportslist@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Congratulations for your subscription')
  end
end
