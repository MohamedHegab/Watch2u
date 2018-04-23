class AddRegionToAddress < ActiveRecord::Migration[5.1]
  def change
  	remove_column :addresses, :city
    add_reference :addresses, :region, type: :uuid, foreign_key: true, index: true
  end
end
