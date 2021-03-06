class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]


  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
      # Takes care of updating infos
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
       log_in @user
       flash[:success] = "Bienvenue sur SportSKorner!"
       redirect_to @user
       #redirect_to login_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :lastname, :firstname, :username, :password, :password_confirmation)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless @user == current_user
   end
end
