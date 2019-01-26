class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :creator, foreign_key: {to_table: :users}
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false
      t.text :message, null: false
      t.timestamps null: false
      t.index [:commentable_type, :commentable_id]
    end
  end
end
