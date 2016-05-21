class CreatePabriks < ActiveRecord::Migration
  def change
    create_table :pabriks, primary_key: "pabrik_id" do |t|
      t.string :pabrik_name

      t.timestamps null: false
    end
  end
end
