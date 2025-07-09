class SessionsController < ApplicationController

  
  def new
    
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
        flash[:notice] = "Logged in #{user.username}."
        redirect_to user
    else
        flash.now[:alert] = 'Wrong login!'
        render 'new'
    end
  end

  def destroy
  end


  
  private


end
