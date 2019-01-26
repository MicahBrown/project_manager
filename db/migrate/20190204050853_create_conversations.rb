class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.belongs_to :creator, foreign_key: {to_table: :users}
      t.belongs_to :crew, null: false
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
