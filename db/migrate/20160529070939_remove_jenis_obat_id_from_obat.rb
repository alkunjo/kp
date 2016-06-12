class RemoveJenisObatIdFromObat < ActiveRecord::Migration
  def up
    remove_foreign_key :obats, :jenis_obat
  end
  def down
  	
  end
end
