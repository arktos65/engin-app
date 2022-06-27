class CreateSources < ActiveRecord::Migration[6.1]
  def change
    create_table :sources do |t|
      t.string :name, null: false
      t.string :contact, null: false
      t.string :contact_title
      t.string :contact_phone
      t.string :contact_email, null: false

      t.timestamps
    end
    add_index :sources, :name
  end
end
