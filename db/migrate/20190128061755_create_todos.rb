class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.belongs_to :creator, foreign_key: {to_table: :users}
      t.belongs_to :crew, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.datetime :completed_at
      t.belongs_to :completer, foreign_key: {to_table: :users}
      t.timestamps null: false
    end
  end
end
