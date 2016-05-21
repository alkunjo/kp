class CreateGrupObats < ActiveRecord::Migration
  def change
    create_table :grup_obats, primary_key: "gobat_id" do |t|
      t.string :gobat_name

      t.timestamps null: false
    end
  end
end
