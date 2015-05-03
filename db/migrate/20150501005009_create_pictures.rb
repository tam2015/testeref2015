class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :article_id
      t.text :image

      t.timestamps null: false
      
    end
  end
end
