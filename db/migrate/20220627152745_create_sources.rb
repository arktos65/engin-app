class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources do |t|
      t.string :name, null: false, limit: 50
      t.string :contact, null: false, limit: 50
      t.string :contact_title, limit: 50
      t.string :contact_phone, limit: 50
      t.string :contact_email, null: false, limit: 80

      t.timestamps
    end
    add_index :sources, :name
  end
end
