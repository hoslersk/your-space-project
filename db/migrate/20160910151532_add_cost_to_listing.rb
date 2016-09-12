class AddCostToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :price, :float
  end
end
