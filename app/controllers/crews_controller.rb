class CrewsController < ApplicationController
  def index
  end

  def show
    @crew = current_user.crews.find(params[:id])

    # redirect_to crew_feed_index_path(@crew)
  end

  def new
  end

  def create
    @crew = Crew.new(crew_params.merge(owner: current_user))
    @crew.crew_members.build(user: current_user)

    if @crew.save
      redirect_to crew_path(@crew)
    else
      render :new
    end
  end

  private

    def crew_params
      params.require(:crew).permit(:name)
    end
end
