class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.belongs_to :stream, null: false, foreign_key: true
      t.string :name
      t.boolean :internal
      t.date :start_date
      t.date :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
