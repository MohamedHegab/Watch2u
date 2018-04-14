class AddSlugToSubCategories < ActiveRecord::Migration[5.1]
  def up
    add_column :sub_categories, :slug, :string
    add_index :sub_categories, :slug, unique: true

    say_with_time 'generating sub category slugs' do
      SubCategory.find_each(&:save)
    end
  end

  def down
    remove_column :sub_categories, :slug, :string
  end
end
