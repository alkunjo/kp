class CreateTransaksiDrops < ActiveRecord::Migration
  def up
    create_table :transaksi_drops, primary_key: "transdrop_id" do |t|
      t.boolean :trans_status
      t.references :sender, index: true
      t.references :receiver, index: true

      t.timestamps null: false
    end
  end
end
