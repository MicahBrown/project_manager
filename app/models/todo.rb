class Todo < ApplicationRecord
  belongs_to :crew
  belongs_to :creator, class_name: "User"
  belongs_to :completer, class_name: "User", optional: true

  validates :title, presence: true
end
