class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, null: false
      t.belongs_to :product, null: false
      t.integer :quantity, null: false
      t.decimal :price, precision: 15, scale: 2, null: false

      t.timestamps
    end

    add_foreign_key :order_items, :orders, name: 'fk_order_items_to_order'
    add_foreign_key :order_items, :products, name: 'fk_order_items_to_product'
  end
end
