class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # authenticate_user!をどうするべきか・意味
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :first_name, :family_name,:first_name_kana, :family_name_kana, :birth_day])
  end
end
