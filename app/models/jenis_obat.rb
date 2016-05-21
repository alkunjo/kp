class JenisObat < ActiveRecord::Base
	self.primary_key='jobat_id'
	has_many :obats
end
