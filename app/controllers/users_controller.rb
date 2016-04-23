class UsersController < ApplicationController
   
  def show 
   @user = User.find(params[:id])
  end  
  
  def new 
    @user = User.new
  end 
  
  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "Bienvenue !" 
      redirect_to @user
    else
      render 'new'
    end
  end 
  
  
  
  def index
    
  end
  
  def edit 
    
  end 
  
  private 
    def user_params 
      params.require(:user).permit(:username, :email, :password,
                                   :password_confirmation)
  
    end

end