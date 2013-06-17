class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'You signed up sucessfully'
      redirect_to pads_path
    else
      render 'new'
    end
  end
end
