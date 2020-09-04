class Users::RegistrationsController < Devise::RegistrationsController

  # Overwrite update_resource to let users to update their user without giving their password
  def update_resource(resource, params)
    if resource.provider == "github"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def profile_sign_up
    @user = current_user
    if @user
      render :profile_sign_up
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end

end
