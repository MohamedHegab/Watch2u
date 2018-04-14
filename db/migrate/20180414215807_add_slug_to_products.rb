class AddSlugToProducts < ActiveRecord::Migration[5.1]
  def up
    add_column :products, :slug, :string
    add_index :products, :slug, unique: true

    say_with_time 'generating product slugs' do
      Product.find_each(&:save)
    end
  end

  def down
    remove_column :products, :slug, :string
  end
end
