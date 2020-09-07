class ChatroomsController < ApplicationController
  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
  end
end
