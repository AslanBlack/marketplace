class UserMailler < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailler.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
    #@greeting = "Hi"
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailler.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Demande de nouveau mot de passe"
  end
end
