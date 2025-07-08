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
        flash[:notice] = "User #{@user.username} created."
        redirect_to articles_path
    else
        render 'new'
    end
  end

  private

  def set_user    
    @user = User.find(params['email'])
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
