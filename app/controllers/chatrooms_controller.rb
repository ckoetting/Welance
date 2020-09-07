class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
  end

  def create_chatroom
    @chatroom = Chatroom.new
    @offer = Offer.find(params[:offer_id])
    @chatroom.name = "Conversation between #{current_user.full_name} and #{@offer.user.business_name}"
    @chatroom.developer = current_user
    @chatroom.business = @offer.user
    @chatroom.save
    redirect_to inquiry_path(current_user.inquiries.last)
  end
end
