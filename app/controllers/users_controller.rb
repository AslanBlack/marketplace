class UsersController < ApplicationController
  before_action :require_logged_in_user, only: [:index, :edit, :update] 
  before_action :require_correct_user,   only: [:edit, :update]
   before_action :admin_user,     only: :destroy
  
  
  
  
  def show 
   @user = User.find(params[:id])
  end  
  
  def new 
    @user = User.new
  end 
  
  def create 
    @user = User.new(user_params)
    if @user.save 
      @user.send_activation_email
      flash[:info] = "Veuillez consulter votre boite mail pour activer votre compte"
      redirect_to root_url

     
    else
      render 'new'
    end
  end 
  
  
  
 def index
  @users = User.paginate(page: params[:page])
 end
  
 def edit
  @user = User.find(params[:id])
 end
 
 def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Changements enregistrés"
      redirect_to @user

    else
      render 'edit'
    end
    
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "Compte supprimé"
      redirect_to users_url
    end
    
 end
  
  private 
    def user_params 
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
  
    end
    
    # Before filters

    # Confirms a logged-in user.
    def require_logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Veuilliez vous connecter svp."
        redirect_to login_path
      end
    end
    
    def require_correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user? (@user)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end