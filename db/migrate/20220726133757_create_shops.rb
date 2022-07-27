class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|

      t.string :name
      t.string :address
      t.string :telepone
      t.string :facsimile
      t.string :open_time
      t.string :close_time
      t.string :off_day
      t.string :website

      t.timestamps
    end
  end
end
