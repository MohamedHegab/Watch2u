class RemoveCustomerIdFromOrders < ActiveRecord::Migration[5.1]
	def up
    remove_column :orders, :customer_id, :integer
    remove_column :orders, :payment_id, :integer
    add_column :orders, :customer_id, :uuid, foriegn_key: true, index: true, default: ''
    add_column :orders, :payment_id, :uuid, foriegn_key: true, index: true, default: ''
  end

  def down
  	remove_column :orders, :customer_id
  	remove_column :orders, :payment_id
  	add_column :orders, :customer_id, :integer
  	add_column :orders, :payment_id, :integer
  end
end
