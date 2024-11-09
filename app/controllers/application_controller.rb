class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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
  private

  def user_not_authorized(exception)
    flash.now[:alert] = "You are not authorized to perform this action."

    render 'errors/unauthorized', status: :forbidden
  end





end
