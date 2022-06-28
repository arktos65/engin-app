class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :name, null: false, limit: 50
      t.boolean :shared, default: false
      t.boolean :administration, default: false

      t.timestamps
    end
    add_index :roles, :name
  end
end
