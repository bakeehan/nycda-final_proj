class UsersController < ApplicationController

  def home
    if !current_user.mentorships[0]
      redirect_to "/brackets"
    end
    require 'date'
    @now = DateTime.now
    cookies.delete :mentorship_id
    if !user_signed_in?
      redirect_to "/users/sign_in"
    else
      # GENERATE FEED
      @comments = helpers.g_comment_feed
      @activities = helpers.g_activity_feed
      @students = helpers.g_student_feed
    end
  end

  def show
  	if user_signed_in?
  		@user = User.find(params[:id])
 	else
 		redirect_to "/users/sign_in"
 	end
  end

  def mentorship
    require 'date'
    @now = DateTime.now
  	@mentorship = Mentorship.find(params[:id])
      cookies[:mentorship_id] = params[:id]
      @feed = helpers.g_mentorship_feed(@mentorship)
  	if current_user == @mentorship.student
  		# STUDENT STUFF
  	elsif current_user == @mentorship.teacher
  		# TEACHER STUFF
  	else
  		redirect_to "/"
  	end
  end
end