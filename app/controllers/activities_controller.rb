class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
    if cookies[:mentorship_id]
      @mentorship = Mentorship.find(cookies[:mentorship_id])
      @activities = @mentorship.activities
    end
  end

  def show
  	@activity = Activity.find(params[:id])
    @submit_it = Achievement.new
  	@bracket = @activity.bracket
    if cookies[:mentorship_id]
      @mentorship = Mentorship.find(cookies[:mentorship_id].to_i)
    end
  end

  def new
  	if current_user.is_admin?
	    @activity = Activity.new
  	else
  		redirect_to "/"
  	end
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.bracket_id = params[:bracket_id]
      if @activity.save
        redirect_to "/activities"
      else
        render "/activities/new"
      end
  end

  def edit
  	if current_user.is_admin?
	    @activity = Activity.find(params[:id])
  	else
  		redirect_to "/"
  	end
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to "/activities"
    else
      render "/activities/#{:id}"
    end
  end

  def destroy
    Activity.find(params[:id]).destroy
    redirect_to "/activities"
  end

  private

	def activity_params
    	params.require(:activity).permit(:title, :description, :bracket_id, :build_array)
	end

end
