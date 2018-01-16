module SessionsHelper
  #User Logs in
  def log_in(user)
    session[:user_id] = user.id
  end

  # Display the current logged-in user if there is any
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #Display true if the user is logged in, false otherwise

    def logged_in?
      !current_user.nil?
    end
end
