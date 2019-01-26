class NotesController < ApplicationController
  def index
    @crew = Crew.find(params[:crew_id])
  end

  def new
    @crew = Crew.find(params[:crew_id])
    @note = @crew.notes.build
  end

  def create
    @crew = Crew.find(params[:crew_id])
    @note = @crew.notes.build(note_params.merge(creator: current_user))

    if @note.save
      redirect_to crew_notes_path(@crew)
    else
      render :new
    end
  end

  def edit
    @crew = Crew.find(params[:crew_id])
    @note = @crew.notes.find(params[:id])
  end

  def update
    @crew = Crew.find(params[:crew_id])
    @note = @crew.notes.find(params[:id])

    if @note.update_attributes(note_params)
      redirect_to crew_notes_path(@crew)
    else
      format.html { render :edit }
    end
  end

  private

    def note_params
      params.require(:note).permit(:text)
    end
end
