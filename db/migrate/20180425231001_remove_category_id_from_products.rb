class RemoveCategoryIdFromProducts < ActiveRecord::Migration[5.1]
  def up
    remove_column :products, :category_id
    add_column :products, :category_id, :uuid, foriegn_key: true, index: true, default: ''
  end

  def down
  	remove_column :products, :category_id
  	add_column :products, :category_id, :integer
  end
end
