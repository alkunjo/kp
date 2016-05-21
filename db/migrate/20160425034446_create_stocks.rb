class CreateStocks < ActiveRecord::Migration
  def up
    create_table :stocks, primary_key: "stock_id" do |t|
      t.integer :stok_qty
      t.references :outlet, index: true
      t.references :obat, index: true

      t.timestamps null: false
    end
    add_foreign_key :stocks, :outlets, primary_key: :outlet_id
    add_foreign_key :stocks, :obats, primary_key: :obat_id
  end

  def down
  	drop_table :stocks
  end
end