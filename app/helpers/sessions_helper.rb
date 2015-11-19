module SessionsHelper

  def log_in(user)
    session[:current_user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:current_user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget current_user
    session.delete(:current_user_id)
    @current_user = nil
  end

  def current_user
    if (user_id = session[:current_user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:current_user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        login user
        @current_user = user
      end
    end
  end

  def logged_in?
    !session[:current_user_id].nil?
  end
end
