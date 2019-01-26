class Attachment < ApplicationRecord
  has_one_attached :file

  belongs_to :creator, class_name: "User"
  belongs_to :crew
end
