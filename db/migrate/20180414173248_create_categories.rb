class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: :uuid do |t|
      t.string :name,              null: false, default: ""
      t.attachment :image

      t.timestamps
    end

    add_index(:categories, [:name])
  end
end
