class CreateKemasans < ActiveRecord::Migration
  def change
    create_table :kemasans, primary_key: "kemasan_id" do |t|
      t.string :kemasan_name
      t.integer :kemasan_vol
      t.integer :kemasan_cap
      t.string :kemasan_unit

      t.timestamps null: false
    end
  end
end
