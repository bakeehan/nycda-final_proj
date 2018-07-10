class TeacherController < ApplicationController
  def index
  	cookies.delete :mentorship_id
  	cookies.delete :admin_mode
  	@classes = Mentorship.where("teacher" => current_user)
  end
end
