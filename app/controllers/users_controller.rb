class UsersController < ApplicationController
  def developers
    @developers = User.where(user_type: "developer")
  end

  def businesses
    @businesses = User.where(user_type: "business")
  end

  def success
    @inquiry = current_user.inquiries.last
  end

  def saved_offers
    @offers = Offer.all
    @saved_offers = []
    @offers.each do |offer|
      if offer.saved
        @saved_offers << offer
      end
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
end
