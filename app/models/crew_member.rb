class CrewMember < ApplicationRecord
  belongs_to :user
  belongs_to :crew
end
