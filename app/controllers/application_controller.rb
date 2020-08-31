class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :user_type, :bio, :location, :dob, :phone_number, :hourly_rate, :headline, :business_address, :business_name, :business_vat_id, :business_size, :website])
  end
end
