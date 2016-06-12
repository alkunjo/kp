class DtransAsk < ActiveRecord::Base
  self.primary_keys = :transaksi_ask_id, :obat_id
  belongs_to :transaksi_ask
  belongs_to :obat
end
