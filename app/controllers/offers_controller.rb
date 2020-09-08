class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :bookmark]

  def index
    if params[:search_by_title_and_location].nil? || params[:search_by_title_and_location].empty?
      @offers = Offer.all
    else
    @offers = Offer.search_by_title_and_location(params[:search_by_title_and_location])
    end
    @q = Offer.ransack(params[:q])
    @offers = @q.result
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def bookmark
    if @offer.saved
      @offer.saved = false
      @offer.save
    else
      @offer.saved = true
      @offer.save
    end
    redirect_to offers_path(anchor: "offer-#{@offer.id}")

  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:title, :description, :skills_required, :compensation, :fixed_price, :deadline_at, :location, :business_name, photos: [])
  end
end
