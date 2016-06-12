class RemoveTransTypeFromTransaksiAsk < ActiveRecord::Migration
  def change
  	remove_foreign_key :transaksi_asks, column: "trans_type_id"
  end
end
