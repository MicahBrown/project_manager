class CreateCrews < ActiveRecord::Migration[5.2]
  def change
    create_table :crews do |t|
      t.string :name, null: false
      t.belongs_to :owner, null: false, foreign_key: {to_table: :users}
      t.timestamps null: false
    end
  end
end
