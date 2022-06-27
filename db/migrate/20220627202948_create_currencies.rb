class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :symbol, limit: 10, null: false
      t.decimal :USDExchange, null: false

      t.timestamps
    end
    add_index :currencies, :symbol
  end
end
