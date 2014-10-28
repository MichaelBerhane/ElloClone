class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash.now[:error] = 'Invalid email/password combo'
        render 'new'
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def forget(user)
      user.forget
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

end
