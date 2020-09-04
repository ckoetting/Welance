class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact_us, :about, :services ]

  def home
  end

  def contact_us
  end

  def about
  end

  def services
  end
end