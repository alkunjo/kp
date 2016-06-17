class TransaksiDrop < ActiveRecord::Base
  self.primary_key = "transdrop_id"
  belongs_to :sender, class_name: "Outlet"
  belongs_to :receiver, class_name: "Outlet"
  attr_accessor :sender_name, :receiver_name, :outlet_name
end
