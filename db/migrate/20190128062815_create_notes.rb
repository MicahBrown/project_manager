class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.belongs_to :creator, foreign_key: {to_table: :users}
      t.belongs_to :crew, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.boolean :shared, default: true, null: false
      t.timestamps null: false
    end
  end
end
