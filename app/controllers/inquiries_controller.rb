class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  def index
    @inquiries = Inquiry.all
  end

  def show
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user = current_user
    @inquiry.offer = Offer.find(params[:id])
    if @inquiry.save
      redirect_to inquiry_path(@inquiry)
    else
      render :new
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
    params.require(:inquiry).permit(:status, :message)
  end
end
