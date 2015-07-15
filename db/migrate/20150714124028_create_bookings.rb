class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :email
      t.string :zip
      t.timestamps null: false
    end
  end
end
