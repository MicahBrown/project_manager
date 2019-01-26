class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def show
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end