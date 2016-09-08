class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.integer :host_id
      t.string :name
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
