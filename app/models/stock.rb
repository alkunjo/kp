class Stock < ActiveRecord::Base
  self.primary_key = :stock_id
  belongs_to :outlet
  belongs_to :obat
  attr_accessor :outlet_name, :obat_name
end