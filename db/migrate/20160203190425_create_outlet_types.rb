class CreateOutletTypes < ActiveRecord::Migration
  def change
    create_table :outlet_types, primary_key: "otype_id" do |t|
      t.string :otype_name

      t.timestamps null: false
    end
  end
end
