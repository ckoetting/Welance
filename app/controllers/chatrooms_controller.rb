class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
  end

  def create_chatroom
    @chatroom = Chatroom.new
    @inquiry = Inquiry.find(params[:id])
    @offer = Offer.find(params[:offer_id])
    @chatroom.name = "#{current_user.full_name} and #{@offer.user.business_name} - #{@offer.title}"
    @chatroom.developer_id = current_user.id
    @chatroom.business_id = @offer.user.id
    @inquiry.chatroom = @chatroom
    if @chatroom.save
      @inquiry.chat = true
      @inquiry.save
      redirect_to chatroom_path(@chatroom)
    end
  end
end
