class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  def index
    @inquiries = current_user.inquiries
  end

  def show
    if @inquiry.status == "pending"
      @inquiry.status = "opened"
      @inquiry.save
    end
    @chatrooms = @inquiry.offer.chatrooms
    @chatroom = nil
    @chatrooms.each do |chatroom|
      @chatroom = chatroom if chatroom.developer_id == current_user.id && chatroom.business_id == @inquiry.offer.user
    end
  end

  def new
    @offer = Offer.find(params[:offer_id])
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user = current_user
    @inquiry.offer = Offer.find(params[:offer_id])
    if @inquiry.save
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
