class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.float :sub_total, precision: 4, scale: 3,   null: false, default: "0"
      t.integer :status
      t.string :number, index: true, null: false, default: '0'
      t.float :total_price, precision: 4, scale: 3,   null: false, default: "0"
      t.integer :customer_id, foreign_key: true, index: true
      t.integer :payment_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
