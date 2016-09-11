class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :venue_id
      t.string :description

      t.timestamps
    end
  end
end
