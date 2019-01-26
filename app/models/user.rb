class User < ApplicationRecord
  has_secure_password

  has_many :crew_members
  has_many :crews, through: :crew_members
end
