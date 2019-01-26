class PollsController < ApplicationController
  def create
    @poll = current_crew.polls.build(poll_params.merge(creator: current_user))
    @poll.save!

    redirect_to crew_feed_index_path(current_crew), notice: "Posted new poll!"
  end

  private

    def poll_params
      params.require(:poll).permit(:title, poll_options_attributes: [:value, :position])
    end
end
