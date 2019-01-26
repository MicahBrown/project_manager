class FeedController < ApplicationController
  def index
    # show:
    # - completed todos
    # - polls
    # - comments & threads
    # - new posted note
    # - file upload

    @crew = current_crew
    @comment = @crew.comments.build
    @poll = @crew.polls.build
    @attachment = @crew.attachments.build
  end
end
