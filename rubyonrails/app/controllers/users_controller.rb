class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'You signed up sucessfully'
      flash[:color] = 'valid'
      redirect_to pads_path
    else
      render 'new'
    end
  end

  def nope

  end
end
