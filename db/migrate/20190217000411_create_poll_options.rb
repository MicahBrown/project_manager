class CreatePollOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :poll_options do |t|
      t.belongs_to :poll, null: false, foreign_key: true
      t.string :value, null: false
      t.integer :position, null: false
      t.timestamps null: false
      t.index [:poll_id, :position], unique: true
      t.index [:poll_id, :value], unique: true
    end
  end
end
