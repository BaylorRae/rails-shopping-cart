=begin
                                      Table "public.products"
   Column    |            Type             |                       Modifiers
-------------+-----------------------------+-------------------------------------------------------
 id          | bigint                      | not null default nextval('products_id_seq'::regclass)
 title       | character varying(150)      | not null
 price       | numeric(15,2)               | not null
 description | text                        |
 created_at  | timestamp without time zone | not null
 updated_at  | timestamp without time zone | not null
Indexes:
    "products_pkey" PRIMARY KEY, btree (id)
    "index_products_on_title" UNIQUE, btree (title)
=end

class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title, limit: 150, null: false
      t.decimal :price, precision: 15, scale: 2, null: false, default: 0
      t.text :description

      t.timestamps

      t.index :title, unique: true
    end
  end
end
