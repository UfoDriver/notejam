class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to pads_path
    else
      flash.now[:error] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    redirect_to home_path
  end
end
