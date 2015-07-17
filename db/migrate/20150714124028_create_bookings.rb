class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :email null:false
      t.string :zip null:false
      t.timestamps null: false
    end
  end
end
