class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        # Log the user in and redirect to the user's show page.
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message = "Compte non activé."
        message += " Les instructions pour activer votre compte vous on été envoyées par e-mail."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Mauvaise combinaison email/mot de passe'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

end