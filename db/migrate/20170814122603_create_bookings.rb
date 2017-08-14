class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :horse, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :price
      t.integer :rating

      t.timestamps
    end
  end
end
