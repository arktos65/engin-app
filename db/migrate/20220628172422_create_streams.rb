class CreateStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :streams do |t|
      t.string :name, null: false, limit: 50
      t.string :stakeholder, limit: 50
      t.string :stakeholder_email, limit: 50

      t.timestamps
    end
    add_index :streams, :name
  end
end
