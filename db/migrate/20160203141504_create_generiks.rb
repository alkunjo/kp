class CreateGeneriks < ActiveRecord::Migration
  def change
    create_table :generiks, primary_key: "generik_id" do |t|
      t.string :generik_name

      t.timestamps null: false
    end
  end
end
