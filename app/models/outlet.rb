class Outlet < ActiveRecord::Base
  self.primary_key= 'outlet_id'
  belongs_to :outlet_type
  has_many :users
  has_many :stocks
  has_many :senders, class_name: "TransaksiAsk", foreign_key: "sender_id"
  has_many :senders, class_name: "TransaksiAsk", foreign_key: "sender_id"
end
