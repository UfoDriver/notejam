class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to pads_path
    else
      redirect_to signin_path
    end
  end
end
