class CreateCrewMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :crew_members do |t|
      t.belongs_to :user, null: false
      t.belongs_to :crew, null: false
      t.timestamps null: false
      t.index [:user_id, :crew_id], unique: true
    end
  end
end
