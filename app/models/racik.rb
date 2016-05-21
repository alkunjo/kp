class Racik < ActiveRecord::Base
	self.primary_key = "racik_id"
	has_many :obats
end
