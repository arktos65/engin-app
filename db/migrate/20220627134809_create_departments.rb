class CreateDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false, limit: 50
      t.string :division, limit: 50
      t.string :manager, limit: 50

      t.timestamps
    end
    add_index :departments, :name, unique: true
  end
end
