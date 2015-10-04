class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :guests
      t.integer :hours
      t.datetime :event_date
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
