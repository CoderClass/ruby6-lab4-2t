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

  def room_params
    params.require(:room).permit(:name)
  end
end
