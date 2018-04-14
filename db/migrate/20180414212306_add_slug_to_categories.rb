class AddSlugToCategories < ActiveRecord::Migration[5.1]
  def up
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true

    say_with_time 'generating category slugs' do
      Category.find_each(&:save)
    end
  end

  def down
    remove_column :categories, :slug, :string
  end
end
