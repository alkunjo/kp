class CreateOutlets < ActiveRecord::Migration
  def up
    create_table :outlets, primary_key: "outlet_id" do |t|
      t.references :outlet_type, index: true
      t.string :outlet_name
      t.string :outlet_address
      t.string :outlet_phone
      t.string :outlet_city
      t.string :outlet_email
      t.string :outlet_fax
      t.timestamps null: false
    end
    add_foreign_key :outlets, :outlet_types, primary_key: :otype_id
  end

  def down
  end
end
