class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :name,                           null: false, default: ""
      t.text :description,                      null: false, default: ""
      t.float :price, precision: 4, scale: 3,   null: false, default: ""
      t.integer :discount
      t.references :sub_category, type: :uuid, foreign_key: true
      t.references :category, type: :uuid, foreign_key: true

      t.timestamps
    end
    add_index(:products, [:name, :sub_category_id, :category_id])
  end
end
