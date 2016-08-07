class CreateTransaksis < ActiveRecord::Migration
  def up
    create_table :transaksis, primary_key: "transaksi_id" do |t|
      t.integer :trans_status
      t.references :sender, index: true
      t.references :receiver, index: true

      t.timestamps null: false
    end
  end
  def down
  	drop_table :transaksis
  end
end
