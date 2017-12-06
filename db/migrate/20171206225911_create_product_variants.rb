class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.belongs_to :product, null: false
      t.string :title, limit: 100, null: false
      t.decimal :price, precision: 15, scale: 2, null: false

      t.timestamps
    end

    add_foreign_key :product_variants, :products, name: 'fk_product_variants_to_product'
  end
end
