class CreateKrediturs < ActiveRecord::Migration
  def change
    create_table :krediturs, primary_key: "kreditur_id" do |t|
      t.string :kreditur_name
      t.string :kreditur_address
      t.string :kreditur_phone
      t.string :kreditur_fax
      t.string :kreditur_email
      t.string :kreditur_cp

      t.timestamps null: false
    end
  end
end
