class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit    
  end

  def create
    @user = User.new(user_params)    
    if @user.save
        # render plain: @user.inspect
        # redirect_to article_path(@user)
        flash[:notice] = "User created."
        redirect_to @user
    else
        render 'new'
    end
  end

  private

  def set_user    
    @user = User.find(params['email'])
  end
  
  def user_params
    params.require(:users).permit(:username, :password)
  end

end
