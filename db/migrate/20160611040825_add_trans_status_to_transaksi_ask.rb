class AddTransStatusToTransaksiAsk < ActiveRecord::Migration
  def change
    add_column :transaksi_asks, :trans_status, :boolean
  end
end
