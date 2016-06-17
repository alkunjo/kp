class DtransDrop < ActiveRecord::Base
  self.primary_keys = :transaksi_drop_id, :obat_id
  belongs_to :transaksi_drop
  belongs_to :obat
  attr_accessor :obat_name
end
