class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?
  helper_method :auth_token

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?(user)
    session[:session_token] == user.session_token
  end

  def require_user!
    unless current_user && logged_in?(current_user)
      redirect_to new_session_url
    end
  end

  def auth_token
    auth =
    <<-HTML
       <input
       type="hidden"
       name="authenticity_token"
       value="<%= form_authenticity_token %>">
    HTML

    auth.html_safe
  end
end
