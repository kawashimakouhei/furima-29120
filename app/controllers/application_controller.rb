class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kouhei' && password == '7970'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_reading])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_reading])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthdate])

  end

  
  
end


