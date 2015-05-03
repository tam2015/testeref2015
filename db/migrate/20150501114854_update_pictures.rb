class UpdatePictures < ActiveRecord::Migration
  def change
    add_column :pictures, :title, :text  	
    add_column :pictures, :content, :text  	
  end
end
