class Poll < ApplicationRecord
  include CrewFeedable

  belongs_to :creator, class_name: "User"
  belongs_to :crew
  has_many :poll_options
    accepts_nested_attributes_for :poll_options

  stream_to_crew_feed :creation, on: :create
end
