class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :add_line1, null: false
      t.string :add_line2
      t.string :phone, null: false
      t.integer :prefecture_id, null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
