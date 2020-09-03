class UsersController < ApplicationController

  def developers
    @developers = User.where(user_type: "developer")
  end

  def businesses
    @businesses = User.where(user_type: "business")
  end
end
