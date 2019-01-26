class HomeController < ApplicationController
  skip_before_action :require_user

  def index
    redirect_to crews_path if logged_in?
  end
end
