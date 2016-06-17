class TransaksiAsk < ActiveRecord::Base
  self.primary_key = "transask_id"
  belongs_to :sender, class_name: "Outlet"
  belongs_to :receiver, class_name: "Outlet"
  has_many :dtrans_asks, dependent: :destroy
  belongs_to :trans_type
  attr_accessor :sender_name, :outlet_name, :receiver_name
end
