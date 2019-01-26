class SessionsController < ApplicationController
  skip_before_action :store_location
  skip_before_action :require_user

  def new
  end

  def create
    @user = User.where("LOWER(email) = ?", params[:email]).first

    if @user&.authenticate(params[:password])
      login!(@user)
      redirect_to_previous_path_or_fallback(root_path)
    else
      redirect_to login_path, alert: "Invalid email and password combination"
    end
  end

  def destroy
    logout!
    redirect_to login_path, notice: "Successfully logged out!"
  end
end
