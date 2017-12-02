class CreateProductCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :product_categories do |t|
      t.belongs_to :product, null: false
      t.belongs_to :category, null: false

      t.timestamps
    end

    add_foreign_key :product_categories, :products, name: 'fk_product_categories_to_products'
    add_foreign_key :product_categories, :categories, name: 'fk_product_categories_to_categories'
  end

  def down
    drop_table :product_categories do |t|
      t.belongs_to :product, foreign_key: true, null: false
      t.belongs_to :category, foreign_key: true, null: false

      t.timestamps
    end
  end
end
