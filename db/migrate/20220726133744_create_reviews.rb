class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :user_id
      t.integer :shop_id
      t.string :title
      t.float :rate
      t.string :ice_name
      t.integer :price
      t.text :feedback
      t.boolean :non_display

      t.timestamps
    end
  end
end
