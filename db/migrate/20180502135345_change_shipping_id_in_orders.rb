class ChangeShippingIdInOrders < ActiveRecord::Migration[5.1]
  def up
  	remove_column :orders, :shipping_id, :integer
    add_reference :orders, :shipping, type: :uuid, foreign_key: true, index: true
  end

  def down
  	remove_column :orders, :shipping_id
  	add_column :orders, :shipping_id, :integer
  end
end
