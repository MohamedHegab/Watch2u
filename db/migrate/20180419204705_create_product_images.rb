class CreateProductImages < ActiveRecord::Migration[5.1]
  def change
    create_table :product_images, id: :uuid do |t|
      t.attachment :image
      t.references :product, type: :uuid, foreign_key: true, index: true

      t.timestamps
    end
  end
end
