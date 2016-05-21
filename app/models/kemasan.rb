class Kemasan < ActiveRecord::Base
	self.primary_key= 'kemasan_id'
	has_many :obats
end
