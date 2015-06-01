module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember
    cookies.signed.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_digest
  end

  def forget(user)
    user.forget
    session[:user_id] = nil
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(user_id)
      if user && user.authenticated?(cookies[:remember_token])
        # log_in user will typically only run once.  If after they've been verifie4d
        # the user id is stored in session so reunning current user will get caught
        # in first user lookup user find by session id.
        log_in user
        @current_user = user
      end
    end
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
end