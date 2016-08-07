class Transaksi < ActiveRecord::Base
  self.primary_key = "transaksi_id"
  belongs_to :sender, class_name: "Outlet"
  belongs_to :receiver, class_name: "Outlet"
  has_many :dtrans
  attr_accessor :outlet_name, :sender_name, :receiver_name
end
