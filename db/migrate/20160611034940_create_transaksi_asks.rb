class CreateTransaksiAsks < ActiveRecord::Migration
  def up
    create_table :transaksi_asks, primary_key: "transask_id" do |t|
      t.references :sender, index: true
      t.references :receiver, index: true
      t.references :trans_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :transaksi_asks, :trans_types, primary_key: :ttype_id
  end
  def down
  	drop_table :transaksi_asks
  end
end
