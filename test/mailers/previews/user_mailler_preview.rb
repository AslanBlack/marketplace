# Preview all emails at http://localhost:3000/rails/mailers/user_mailler
class UserMaillerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailler/account_activation
  def account_activation
   user = User.first
   user.activation_token = User.new_token
   UserMailler.account_activation(user)

  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailler/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailler.password_reset(user)
  end

end
