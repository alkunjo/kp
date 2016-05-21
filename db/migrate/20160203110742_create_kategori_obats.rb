class CreateKategoriObats < ActiveRecord::Migration
  def change
    create_table :kategori_obats, primary_key: "kobat_id" do |t|
      t.string :kobat_name

      t.timestamps null: false
    end
  end
end
