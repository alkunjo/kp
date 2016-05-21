class CreateDosages < ActiveRecord::Migration
  def change
    create_table :dosages, primary_key: "dosage_id" do |t|
      t.string :dosage_name
      t.string :dosage_judul

      t.timestamps null: false
    end
  end
end
