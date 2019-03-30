class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone, :encrypted_password, :reset_password_token, :photo])
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end