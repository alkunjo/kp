class Pabrik < ActiveRecord::Base
	self.primary_key= "pabrik_id"
	has_many :obats
	has_many :kreditur_pabriks, dependent: :delete_all
end
