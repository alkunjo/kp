class CreateDtransAsks < ActiveRecord::Migration
  def change
    create_table :dtrans_asks, {:id => false} do |t|
      t.integer :dta_qty
      t.references :transaksi_ask, index: true
      t.references :obat, index: true

      t.timestamps null: false
    end
    add_foreign_key :dtrans_asks, :obats, primary_key: :obat_id
    add_foreign_key :dtrans_asks, :transaksi_asks, primary_key: :transask_id
    execute "ALTER TABLE dtrans_asks ADD PRIMARY KEY (obat_id,transaksi_ask_id);"
  end
end
