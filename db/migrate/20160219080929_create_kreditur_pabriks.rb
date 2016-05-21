class CreateKrediturPabriks < ActiveRecord::Migration
  def change
    create_table :kreditur_pabriks, {:id => false} do |t|
      t.references :kreditur, index: true
      t.references :pabrik, index: true

      t.timestamps null: false
    end
    add_foreign_key :kreditur_pabriks, :krediturs, primary_key: :kreditur_id
    add_foreign_key :kreditur_pabriks, :pabriks, primary_key: :pabrik_id
    execute "ALTER TABLE kreditur_pabriks ADD PRIMARY KEY (kreditur_id,pabrik_id);"
  end
end
