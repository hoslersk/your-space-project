class AddZipCodeToVenues < ActiveRecord::Migration[5.0]
  def change
    add_column :venues, :zip_code, :string
  end
end
