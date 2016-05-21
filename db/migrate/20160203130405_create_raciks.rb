class CreateRaciks < ActiveRecord::Migration
  def change
    create_table :raciks, primary_key: "racik_id" do |t|
      t.string :racik_name

      t.timestamps null: false
    end
  end
end
