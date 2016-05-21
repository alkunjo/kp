class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles, primary_key: "role_id" do |t|
      t.string :role_name
      t.text :role_desc

      t.timestamps null: false
    end
  end
end
