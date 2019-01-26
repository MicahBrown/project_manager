class Comment < ApplicationRecord
  include CrewFeedable

  belongs_to :commentable, polymorphic: true
  belongs_to :user, optional: true

  stream_to_crew_feed :creation, on: :create, if: :crew_comment?, with: :commentable

  validates :message, presence: true

  def crew_comment?
    commentable.is_a?(Crew)
  end
end
