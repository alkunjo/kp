class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, primary_key: "user_id" do |t|
      t.references :role, index: true
      t.references :position, index: true
      t.string :user_username
      t.string :user_name
      t.string :user_address
      t.string :user_phone
      
      t.timestamps null: false
    end
    add_foreign_key :users, :roles, primary_key: :role_id
    add_foreign_key :users, :positions, primary_key: :position_id
  end

  def down
    drop_table :users
  end
end
