class AddColumnsToDtran < ActiveRecord::Migration
  def up
  	add_column :dtrans, :dtt_qty, :integer
  	add_column :transaksis, :asked_at, :datetime
  	add_column :transaksis, :dropped_at, :datetime
  	add_column :transaksis, :accepted_at, :datetime
  end

  def down
  	
  end
end
