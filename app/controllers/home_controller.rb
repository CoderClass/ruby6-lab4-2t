class HomeController < ApplicationController
  def index
    if params[:username]
      login
    end
    @rooms = Room.all
  end

  def login
    session[:username] = params[:username].presence
    redirect_to root_path
  end

  def logout
    session[:username] = nil
    redirect_to root_path
  end
end
