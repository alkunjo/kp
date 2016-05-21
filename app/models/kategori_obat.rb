class KategoriObat < ActiveRecord::Base
	self.primary_key = 'kobat_id'
	has_many :obats
end
