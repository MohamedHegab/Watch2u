class RemoveFieldDiscountFromProuducts < ActiveRecord::Migration[5.1]
  def up
    remove_column :products, :discount, :integer
    add_column :products, :discount, :integer, default: '0'
  end

  def down
    remove_column :products, :discount, :integer
    add_column :products, :discount, :integer
  end
end
