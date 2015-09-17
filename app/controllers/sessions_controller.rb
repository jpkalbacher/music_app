class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
      )

    if user.nil?
      render json: 'nope!'
    else
      login!(user)
      render json: 'yep!'
    end
  end

  def destroy
    session[:session_token] = nil
  end
end
