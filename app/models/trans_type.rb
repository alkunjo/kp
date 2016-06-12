class TransType < ActiveRecord::Base
	self.primary_key = 'ttype_id'
	has_many :transaksis
end
