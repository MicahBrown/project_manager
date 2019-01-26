class ApplicationController < ActionController::Base
  before_action :store_location, if: :page_returnable?
  before_action :require_user

  def require_user
    redirect_to(login_path) unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end
  helper_method :current_user

  def current_crew
    @current_crew ||= Crew.find_by(id: $1) if request.path&.match(/\/crews\/(\d+)/)
  end
  helper_method :current_crew

  def login!(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def logout!
    session[:user_id] = nil
    @current_user = nil
  end

  def logged_in?
    current_user.present?
  end
  helper_method :logged_in?

  def store_location
    session["previous_path"] = request.fullpath
  end

  def redirect_to_previous_path_or_fallback(fallback, options={})
    path = session["previous_path"] || fallback
    session["previous_path"] = nil

    redirect_to(path, options)
  end

  private

    def page_returnable?
      request.format == 'html' && request.get?
    end
end
