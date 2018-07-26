class StudentController < ApplicationController

  def index
    require 'date'
    cookies.delete :admin_mode
  	cookies.delete :mentorship_id
  	if user_signed_in? && current_user.mentorships[0]
  		@mentorships = current_user.mentorships
  	else
  		redirect_to "/"
  	end
  end

  def feedback
  end

end
