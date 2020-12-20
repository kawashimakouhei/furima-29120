class CreateItems < ActiveRecord::Migration[6.0]
  def change
   create_table :items do |t|
     t.string :title          , null: false
     t.text :text           , null: false
     t.integer :price          , null: false
     t.integer :category_id    , null: false
     t.integer :condition_id   , null: false
     t.integer :shipping_id    , null: false
     t.integer :prefecture_id  , null: false
     t.integer :day_to_ship_id , null: false
     t.timestamps
    end
  end
end


