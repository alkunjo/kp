class Generik < ActiveRecord::Base
	self.primary_key = "generik_id"
	has_many :obats
end
