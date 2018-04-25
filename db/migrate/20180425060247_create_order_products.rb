class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid, index: true
      t.references :product, foreign_key: true, type: :uuid, index: true
      t.float :price, precision: 4, scale: 3,   null: false, default: "0"
      t.integer :quantity

      t.timestamps
    end
  end
end
