class CreateValueStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :value_streams do |t|
      t.string :name, null: false, limit: 50
      t.string :stakeholder, limit: 50
      t.string :stakeholder_email, limit: 50

      t.timestamps
    end
    add_index :value_streams, :name
  end
end
