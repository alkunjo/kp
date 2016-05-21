class Obat < ActiveRecord::Base
  self.primary_key = :obat_id
  belongs_to :grup_obat
  belongs_to :generik
  belongs_to :dosage
  belongs_to :jenis_obat
  belongs_to :racik
  belongs_to :kategori_obat
  belongs_to :kemasan
  belongs_to :pabrik
  has_many :stocks
end
