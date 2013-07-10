class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :populate_pads
  include SessionsHelper

  def handle_unverified_request
    sign_out
    super
  end

  private

  def populate_pads
    @pads = current_user.pads if signed_in?
  end
end
