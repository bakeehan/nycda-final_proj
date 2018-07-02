class UsersController < ApplicationController
  def show
  	if user_signed_in?
  		@user = User.find(params[:id])
 	else
 		redirect_to "/users/sign_in"
 	end
  end
end