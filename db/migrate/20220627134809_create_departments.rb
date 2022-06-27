class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :division
      t.string :manager

      t.timestamps
    end
    add_index :departments, :name, unique: true
  end
end
