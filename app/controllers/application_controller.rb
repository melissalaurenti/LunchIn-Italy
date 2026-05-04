class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name, :last_name, :job, :bio, :avatar_url, :language,
      :role, :city_id, :birthday, :linkedin_url, :company, :location, :industry
    ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :first_name, :last_name, :job, :bio, :avatar_url, :language,
      :role, :city_id, :birthday, :linkedin_url, :company, :location, :industry
    ])
  end
end
