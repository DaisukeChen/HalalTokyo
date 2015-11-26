class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :detail
      t.text  :open_hours
      t.text :close     
      t.text :address
      t.text :image_url
      t.text :phone
      t.text :email    
      t.text :web_url

      t.timestamps 
    end
  end
end
