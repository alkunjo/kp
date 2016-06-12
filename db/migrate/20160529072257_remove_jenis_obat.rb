class RemoveJenisObat < ActiveRecord::Migration
  def change
  	remove_column :obats, :jenis_obat_id
  	drop_table :jenis_obats
  end
end
