class CreateDtransAsks < ActiveRecord::Migration
  def change
    create_table :dtrans_asks, {id: false} do |t|
      t.references :transaksi_ask, index: true
      t.references :obat, index: true
      t.integer :dta_qty

      t.timestamps null: false
    end
    add_foreign_key :dtrans_asks, :transaksi_asks, primary_key: :transask_id
    add_foreign_key :dtrans_asks, :obats, primary_key: :obat_id
    execute "ALTER TABLE dtrans_asks ADD PRIMARY KEY (transaksi_ask_id, obat_id)"
  end
end
