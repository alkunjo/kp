class CreateDtransDrops < ActiveRecord::Migration
  def change
    create_table :dtrans_drops, {id: false} do |t|
      t.integer :dtd_req
      t.integer :dtd_qty
      t.string :dtd_rsn
      t.references :transaksi_drop, index: true
      t.references :obat, index: true

      t.timestamps null: false
    end
    add_foreign_key :dtrans_drops, :obats, primary_key: :obat_id
    add_foreign_key :dtrans_drops, :transaksi_drops, primary_key: :transdrop_id
    execute "ALTER TABLE dtrans_drops ADD PRIMARY KEY (obat_id, transaksi_drop_id);"
  end
end
