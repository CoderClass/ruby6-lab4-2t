class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new room_params
    if @room.save
      flash[:success] = "Create new room successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @room = Room.find(params[:id])
    redirect_to room_messages_path(@room.id)
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
