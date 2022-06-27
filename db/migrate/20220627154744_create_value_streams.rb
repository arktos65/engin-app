class CreateValueStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :value_streams do |t|
      t.string :name, null: false
      t.string :stakeholder
      t.string :stakeholder_email

      t.timestamps
    end
    add_index :value_streams, :name
  end
end
