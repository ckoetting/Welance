class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def developers
    @developers = User.where(user_type: "developer")
  end

  def businesses
    @businesses = User.where(user_type: "business")
  end

  def success
    @inquiry = current_user.inquiries.last
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@offer)
  end

  def saved_offers
    @offers = Offer.all
    @saved_offers = []
    @offers.each do |offer|
      @saved_offers << offer if offer.saved
    end
  end

  def job_offers
    @job_offers = []
    current_user.offers.each do |offer|
      offer.inquiries.each do |inquiry|
        @job_offers << inquiry
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :full_name, :user_type, :bio, :location, :dob,
      :phone_number, :hourly_rate, :headline, :business_address,
      :business_name, :business_vat_id, :business_size, :website,
      :provider, :uid, :avatar_url, :developer_role, :username,
      :linkedin_url, :photo
      )
  end

end
