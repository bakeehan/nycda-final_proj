class AdminController < ApplicationController
  def index
    cookies.delete :mentorship_id
  	cookies[:admin_mode] = true
  end
end
