class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    if user.save!
      login!(user)
      render :show
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end