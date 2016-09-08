class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.integer :listing_id
      t.integer :renter_id
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :confirmed?, default: false

      t.timestamps
    end
  end
end
