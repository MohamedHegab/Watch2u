class CreateShippings < ActiveRecord::Migration[5.1]
  def change
    create_table :shippings, id: :uuid do |t|
      t.string :name,												   null: false, default: ""
      t.float :fees, precision: 4, scale: 3,   null: false, default: "0"

      t.timestamps
    end
  end
end
