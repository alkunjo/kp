class ChangeStringInDtrans < ActiveRecord::Migration
  def up
  	change_column :dtrans, :dt_rsn, :string
  end
  def down
  	change_column :dtrans, :dt_rsn, :integer
  end
end
