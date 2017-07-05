class MessagesController < ApplicationController
  def index
    @room = Room.find(params[:room_id].to_i)
    @messages = @room.messages.all
  end

  def create
    @room = Room.find(params[:room_id])
    message = @room.messages.new
    message.content = params[:message][:content]
    message.username = current_user
    message.save

    redirect_to room_messages_path(@room)
  end
end
