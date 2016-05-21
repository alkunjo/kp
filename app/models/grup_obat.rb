class GrupObat < ActiveRecord::Base
	self.primary_key = "gobat_id"
	has_many :obats
end
