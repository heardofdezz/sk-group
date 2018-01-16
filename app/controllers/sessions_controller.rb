class SessionsController < ApplicationController
  def new
  end

  def create
  user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's profile/show page
      # Solely if both informations match
    else
      # Create error message if the params do not match the data base
      flash[:danger] = 'Invalid email/password or combination' #Try again
      render 'new'
    end
  end

  def destroy
  end
  
end
