class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, :unless => :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_date, :sexe, :level, :photo])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birth_date, :sexe, :level, :photo])
  end

  private

  # override the devise method for where to go after signing out because theirs
  # always goes to the root path. Because devise uses a session variable and
  # the session is destroyed on log out, we need to use request.referrer
  # root_path is there as a backup
  def store_current_location
    store_location_for(:user, request.url) if request.get?
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end
end
