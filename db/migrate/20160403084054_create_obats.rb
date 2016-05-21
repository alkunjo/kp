class CreateObats < ActiveRecord::Migration
  def change
    create_table :obats, primary_key: "obat_id" do |t|
      t.references :grup_obat, index: true
      t.references :generik, index: true
      t.references :dosage, index: true
      t.references :jenis_obat, index: true
      t.references :racik, index: true
      t.references :kategori_obat, index: true
      t.references :kemasan, index: true
      t.references :pabrik, index: true
      t.string :obat_name
      t.integer :obat_minStock
      t.integer :obat_hpp
      t.integer :obat_hna
      t.integer :obat_kons
      t.integer :obat_askes
      t.integer :obat_hnask
      t.integer :obat_hnahppn
      t.integer :obat_hnaskppn
      t.integer :obat_hja

      t.timestamps null: false
    end
    add_foreign_key :obats, :grup_obats, primary_key: :gobat_id
    add_foreign_key :obats, :generiks, primary_key: :generik_id
    add_foreign_key :obats, :dosages, primary_key: :dosage_id
    add_foreign_key :obats, :jenis_obats, primary_key: :jobat_id
    add_foreign_key :obats, :raciks, primary_key: :racik_id
    add_foreign_key :obats, :kategori_obats, primary_key: :kobat_id
    add_foreign_key :obats, :kemasans, primary_key: :kemasan_id
    add_foreign_key :obats, :pabriks, primary_key: :pabrik_id
  end

  def down
    
  end
end
