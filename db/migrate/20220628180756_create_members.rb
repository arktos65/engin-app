class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :first_name, null: false, limit: 30
      t.string :last_name, null: false, limit: 30
      t.belongs_to :role, null: false, foreign_key: true
      t.belongs_to :department, null: false, foreign_key: true
      t.belongs_to :source, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
