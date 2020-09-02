class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :full_name, :user_type, :bio, :location, :dob,
      :phone_number, :hourly_rate, :headline, :business_address,
      :business_name, :business_vat_id, :business_size, :website
    ])
    update_attrs = [:full_name, :user_type, :bio, :location, :dob,
      :phone_number, :hourly_rate, :headline, :business_address,
      :business_name, :business_vat_id, :business_size, :website,
      :password, :password_confirmation, :current_password]
      devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    end
  end


# class ApplicationController < ActionController::Base
#     # Prevent CSRF attacks by raising an exception.
#     # For APIs, you may want to use :null_session instead.
#     protect_from_forgery with: :exception

#     before_filter :configure_permitted_parameters, if: :devise_controller?

#     protected

#         def configure_permitted_parameters
#             devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
#             devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
#         end
# end
