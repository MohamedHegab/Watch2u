class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :city
      t.string :country
      t.string :street_address
      t.string :floor_no
      t.string :building_no
      t.string :lat
      t.string :lng
      t.references :user, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
    # add_index(:addresses, [:user_id])

  end
end
