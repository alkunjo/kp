class Dtran < ActiveRecord::Base
  self.primary_keys = :transaksi_id, :obat_id
  belongs_to :transaksi
  belongs_to :obat
  attr_accessor :obat_name
end
