class Note < ApplicationRecord
  belongs_to :crew
  belongs_to :creator, class_name: "User"
end
