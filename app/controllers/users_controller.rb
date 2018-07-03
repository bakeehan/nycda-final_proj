class UsersController < ApplicationController

  def show
  	if user_signed_in?
  		@user = User.find(params[:id])
 	else
 		redirect_to "/users/sign_in"
 	end
  end

  def mentorship
  	@mentorship = Mentorship.find(params[:id])
  	if current_user == @mentorship.student
  		cookies[:mentorship_id] = params[:id]
  	elsif current_user == @mentorship.teacher
  		# TEACHER STUFF
  	else
  		redirect_to "/"
  	end
  end
end