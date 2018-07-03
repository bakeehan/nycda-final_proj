class ActivitiesController < ApplicationController
  def index
  	@activities = Activity.all
  end

  def show
  	@activity = Activity.find(params[:id])
  	@bracket = @activity.bracket
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

  private

	def activity_params
    	params.require(:activity).permit(:title, :description, :bracket_id, :build_array)
	end

end
