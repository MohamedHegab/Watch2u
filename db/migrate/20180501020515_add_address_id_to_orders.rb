class AddAddressIdToOrders < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :address, foreign_key: true, index: true, type: :uuid
    add_column :orders, :shipping_id, :integer, foreign_key: true, index: true, type: :uuid
  end
end
