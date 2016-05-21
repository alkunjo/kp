class AddOutletToUser < ActiveRecord::Migration
  def up
  	add_reference	:users, :outlet, index: true
  	add_foreign_key :users, :outlets, primary_key: :outlet_id
  end
  def down
  	
  end
end
