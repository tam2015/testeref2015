class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :brand_id
      t.integer :store_id
      t.string :ref
      t.text :description
      t.integer :category_id
      t.integer :sub_category_id

      t.timestamps null: false
    end
    add_index :products, [:brand_id, :store_id, :sub_category_id, :category_id], name: 'product_index'
  end
end
