class SessionsController < ApplicationController

  def create
    #session[:current_user] = @user.id
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid username and password combination'
      render 'new'
    end
  end

  def new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
