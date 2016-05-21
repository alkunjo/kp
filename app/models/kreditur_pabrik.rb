class KrediturPabrik < ActiveRecord::Base
  self.primary_keys = :kreditur_id, :pabrik_id
  belongs_to :kreditur
  belongs_to :pabrik
end
