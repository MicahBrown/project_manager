class Crew < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :crew_members
  has_many :members, through: :crew_members, source: :user
  has_many :notes
  has_many :comments, as: :commentable
  has_many :polls
  has_many :attachments
  has_many :todos
  has_many :feeds
end
