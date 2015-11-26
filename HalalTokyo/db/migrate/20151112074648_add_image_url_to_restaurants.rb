class AddImageUrlToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :image_url2, :text
    add_column :restaurants, :image_url3, :text
    add_column :restaurants, :image_url4, :text
    add_column :restaurants, :image_url5, :text    
  end
end
