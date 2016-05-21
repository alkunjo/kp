class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions, primary_key: "position_id" do |t|
      t.string :position_name

      t.timestamps null: false
    end
  end
end
