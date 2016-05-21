class CreateJenisObats < ActiveRecord::Migration
  def change
    create_table :jenis_obats, primary_key: "jobat_id" do |t|
      t.string :jobat_name

      t.timestamps null: false
    end
  end
end
