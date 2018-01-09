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
    @user.save
    redirect_to users_new_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :lastname, :firstname, :username, :password, :password_confirmation)
    end
end
