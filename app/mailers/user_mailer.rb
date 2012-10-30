class UserMailer < ActionMailer::Base
  default :from => "BodyKit.Me <info@bodykit.me>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

  def registration(user)
    @user = user
    mail :to => user.email, :subject => "Confirm your registration at Bodykit.Me", :from => "pfischer@line030.de"
  end

end
