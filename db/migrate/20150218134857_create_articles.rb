class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.string :image
      t.integer :user_id
      t.string  :author
      t.boolean :top_deal, default: false
      t.boolean :published, default: false

      t.timestamps null: false
    end

    add_index :articles, [:content, :top_deal, :published]

  end
end
