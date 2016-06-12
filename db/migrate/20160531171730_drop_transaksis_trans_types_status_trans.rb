class DropTransaksisTransTypesStatusTrans < ActiveRecord::Migration
  def change
  	drop_table :transaksis
  	drop_table :trans_types
  	drop_table :status_trans
  end
end
