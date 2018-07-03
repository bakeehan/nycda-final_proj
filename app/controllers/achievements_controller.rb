class AchievementsController < ApplicationController
  def index
  	mentorship = Mentorship.find(cookies[:mentorship_id].to_i)
  	if mentorship.student == current_user || mentorship.teacher == current_user
  		# @achievements = Achievement.all
  		@achievements = mentorship.achievements
	else
	  	redirect_to "/"
	end
  end

  def show
  	mentorship = Mentorship.find(cookies[:mentorship_id].to_i)
  	@achievement = Achievement.find(params[:id])
  	@bracket = @achievement.bracket
  end

  def new
  	mentorship = Mentorship.find(cookies[:mentorship_id].to_i)
  	if mentorship.student == current_user
	    @achievement = Achievement.new
	else
		redirect_to "/"
	end
  end

  def create
	@achievement = Achievement.new(achievement_params)
	@achievement.activity_id = params[:activity_id]
	@achievement.mentorship_id = cookies[:mentorship_id].to_i
	@achievement.user_id = current_user.id
	if @achievement.save
    	redirect_to "/achievements"
	else
    	render "/achievements/new"
	end
  end

  def edit
  	mentorship = Mentorship.find(cookies[:mentorship_id].to_i)
  	if mentorship.student == current_user
	    @achievement = Achievement.find(params[:id])
	else
		redirect_to "/achievements"
	end
  end

  def update
    @achievement = Achievement.find(params[:id])
    if @achievement.update(achievement_params)
      redirect_to "/achievements"
    else
      render "/achievements/#{:id}"
    end
  end

  private

	def achievement_params
    	params.require(:achievement).permit(:activity_id, :user_id, :is_private, :title, :content, :mentorship_id)
	end

end