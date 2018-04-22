class AddRegionIdToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :region
    remove_column :users, :address
    add_reference :users, :region, type: :uuid, foreign_key: true, index: true
  end
end
