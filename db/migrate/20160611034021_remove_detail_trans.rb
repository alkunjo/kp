class RemoveDetailTrans < ActiveRecord::Migration
  def change
  	drop_table :detail_trans
  end
end
