class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def not_found
    render status: 404, file: 'public/404.html', layout: false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password])
  end

  def after_sign_in_path_for(resource)
    if user_signed_in?
      admin_users_path
    else
      super
    end
  end



end
