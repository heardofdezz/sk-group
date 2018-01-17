class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
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
end
