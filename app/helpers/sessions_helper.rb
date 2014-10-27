module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attributes(:remember_token, User.digest(remember_token))
    self.current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Logs in the given user.

  def log_in(user)
      session[:user_id] = user.id
  end


  def logged_in?
    !current_user.nil?
  end

end
