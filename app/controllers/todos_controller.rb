class TodosController < ApplicationController
  def index
    @crew = Crew.find(params[:crew_id])
  end

  def new
    @crew = Crew.find(params[:crew_id])
    @todo = @crew.todos.build
  end

  def create
    @crew = Crew.find(params[:crew_id])
    @todo = @crew.todos.build(todo_params.merge(creator: current_user))

    if @todo.save
      redirect_to crew_todos_path(@crew)
    else
      render :new
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:title, :description)
    end
end
