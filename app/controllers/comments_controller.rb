class CommentsController < ApplicationController

	def create
	  @comment = Comment.new(comment_params)
	  @comment.achievement_id = params[:achievement_id]
	  @comment.user_id = current_user.id
	  	if @comment.save
	      	redirect_to "/achievements/#{@comment[:achievement_id]}"
	  	else
	      	redirect_to "/achievements/#{@comment[:achievement_id]}"
	  	end
	end

  private

	def comment_params
    	params.require(:comment).permit(:achievement_id, :user_id, :content)
	end

end