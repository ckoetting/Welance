class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy, :change_status]

  def index
    @inquiries = current_user.inquiries
  end

  def change_status
    if params[:accepted] == "true"
      @inquiry.status = "Accepted"
    else
      @inquiry.status = "Declined"
    end
    @inquiry.save
    redirect_to offer_inquiry_path(@inquiry.offer, @inquiry)
    flash.notice = "Application status changed successfully!"
  end

  def show
    @offer = Offer.find(params[:offer_id])
    if @inquiry.status == "pending"
      @inquiry.status = "opened"
      @inquiry.save
    end
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @inquiry = Inquiry.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user = current_user
    @inquiry.offer = @offer
    if @inquiry.save!
      redirect_to inquiry_sent_path
      flash.notice = "Your application as been sent!"
    else
      render :new
      flash.alert = "Ops! Something went wrong."
    end
  end

  def destroy
    @inquiry.destroy
    redirect_to inquiries_path
  end

  def edit
  end

  def update
    @inquiry.update(inquiry_params)
    redirect_to inquiry_path(@inquiry)
  end

  private

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

  def inquiry_params
    params.require(:inquiry).permit(:status, :message, :chat)
  end
end
