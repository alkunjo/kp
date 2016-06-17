class DtransAsk < ActiveRecord::Base
  self.primary_keys = :transaksi_ask_id, :obat_id
  belongs_to :transaksi_ask
  belongs_to :obat
  attr_accessor :obat_name
end
