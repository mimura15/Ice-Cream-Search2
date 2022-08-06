class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|

      t.string :name
      t.string :address
      t.string :telepone
      t.string :facsimile
      t.time :open_time
      t.time :close_time
      t.string :off_day
      t.string :website

      t.timestamps
    end
  end
end
