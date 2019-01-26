class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.belongs_to :crew, null: false, foreign_key: true
      t.integer :feedable_id, null: false
      t.string  :feedable_type, null: false
      t.string :name, null: false
      t.timestamps null: false
      t.index [:feedable_type, :feedable_id]
    end
  end
end
