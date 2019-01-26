class Feed < ApplicationRecord
  ACTIONS = [:create, :update, :destroy].freeze

  belongs_to :crew
  belongs_to :feedable, polymorphic: true
  has_many :comments, as: :commentable

  validates :name, presence: true
end
