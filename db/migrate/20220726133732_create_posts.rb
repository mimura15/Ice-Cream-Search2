class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.integer :shop_id
      t.string :title
      t.text :content
      t.boolean :non_display, default: false

      t.timestamps
    end
  end
end
