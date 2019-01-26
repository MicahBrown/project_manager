class CommentsController < ApplicationController
  def create
    @commentable = load_commentable
    @comment = Comment.new(comment_params.merge(commentable: @commentable))
    @comment.save!

    redirect_to crew_feed_index_path(current_crew), notice: "Posted new comment!"
  end

  private

    def comment_params
      params.require(:comment).permit(:message)
    end

    def load_commentable
      if params[:feed_id].present?
        Feed.find(params[:feed_id])
      else
        current_crew
      end
    end
end
