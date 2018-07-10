class AdminController < ApplicationController
  def index
    cookies.delete :mentorship_id
  	cookies[:admin_mode] = "true"
    @all = Mentorship.all
  end

  def mentorship
    cookies.delete :mentorship_id
  	cookies[:admin_mode] = "true"
  	@journey = Mentorship.new
  end

  def create
    @journey = Mentorship.new(mentorship_params)
    @journey.bracket_id = params[:bracket_id].to_i
    @journey.student_id = params[:student_id].to_i
    @journey.teacher_id = params[:teacher_id].to_i
      if @journey.save
        redirect_to "/admin"
      else
        cookies[:failure] = @journey.errors.messages[:bracket]
        redirect_to "/journeys/new"
      end
  end

  def switch
    cookies.delete :admin_mode
    redirect_to "/"
  end

  private

	def mentorship_params
    	params.require(:mentorship).permit(:title, :student_id, :bracket_id, :teacher_id, :is_complete, :end_date)
	end

end