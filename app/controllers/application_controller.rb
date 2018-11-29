class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
  end

  def after_sign_in_path_for(user)
    if user.supervisor
      tournaments_path
    else
      player_convocations_path
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :licence])
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

end
