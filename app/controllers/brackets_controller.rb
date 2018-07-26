class BracketsController < ApplicationController

  def index
    cookies.delete :mentorship_id
  	@brackets = Bracket.all
  end

  def new
  	if current_user.is_admin?
	    @bracket = Bracket.new
	else
		redirect_to "/"
	end
  end

  def create
    @bracket = Bracket.new(bracket_params)
	  @bracket.description = params[:description][:text]
	  @bracket.level_system = ["beginner", "intermediate", "advanced"]
      if @bracket.save
        redirect_to "/brackets"
      else
        render "/brackets/new"
      end
  end

  def show
    @bracket = Bracket.find(params[:id])
    @staff = []
    @bracket.teachers.each do |nerd|
      if !@staff.include?(nerd)
        @staff.push (nerd)
      end
    end
  end

  def edit
    if current_user.is_admin?
      @bracket = Bracket.find(params[:id])
    else
      redirect_to "/"
    end
  end

  def update
    @bracket = Bracket.find(params[:id])
    if @bracket.update(bracket_params)
      redirect_to "/brackets"
    else
      render "/brackets/#{:id}"
    end

  def destroy
    Bracket.find(params[:id]).destroy
    redirect_to "/brackets"
  end
  end

  private

	def bracket_params
    	params.require(:bracket).permit(:title, :description, :level_system, :icon)
	end

end