class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in(@user)
      if @user.user_type?
        redirect_to root_path(@user)
      else
        @user.update(user_type: 'Developer')
        redirect_to profile_sign_up_path event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
      end
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
