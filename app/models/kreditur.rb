class Kreditur < ActiveRecord::Base
	self.primary_key = "kreditur_id"
	has_many :kreditur_pabriks
end
