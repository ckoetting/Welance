class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :contact_us ]

  def home
  end

  def contact_us
  end
end
