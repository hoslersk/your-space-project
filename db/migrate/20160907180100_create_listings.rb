class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.integer :venue_id
      t.date :available_start_date
      t.date :available_end_date
      t.time :available_start_time
      t.time :available_end_time

      t.timestamps
    end
  end
end
