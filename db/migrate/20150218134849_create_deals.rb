class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :store_id
      t.integer :brand_id
      t.integer :product_id
      t.integer :category_id
      t.integer :sub_category_id
      t.integer :article_id
      t.float :original_price
      t.float :sales_price
      t.float :discount
      t.string :shipping
      t.string :payment
      t.integer :status
      t.string :warrant
      t.time :beginning
      t.time :ending
      t.text :promotion_url

      t.timestamps null: false
    end
    add_index :deals, [:discount, :store_id, :brand_id, :product_id, :category_id, :sub_category_id, :article_id ], name: 'deal_index'
  end
end
