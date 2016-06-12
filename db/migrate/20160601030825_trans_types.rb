class TransTypes < ActiveRecord::Migration
  def up
    create_table :trans_types, primary_key: "ttype_id" do |t|
      t.string :ttype_name

      t.timestamps null: false
    end
  end
end
