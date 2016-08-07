class CreateDtrans < ActiveRecord::Migration
  def up
    create_table :dtrans, {id: false} do |t|
      t.integer :dta_qty
      t.integer :dtd_qty
      t.integer :dt_rsn
      t.references :obat, index: true
      t.references :transaksi, index: true

      t.timestamps null: false
    end
    add_foreign_key :dtrans, :obats, primary_key: :obat_id
    add_foreign_key :dtrans, :transaksis, primary_key: :transaksi_id
    execute "ALTER TABLE dtrans ADD PRIMARY KEY (obat_id,transaksi_id);"
  end
  def down
    drop_table :dtrans
  end
end
