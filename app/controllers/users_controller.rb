class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.create(params[:user])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully update your profile"
      redirect_to @user
    else
      render 'edit'
    end
  end

end
