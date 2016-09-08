class AddDefaultValueToConfirmedAttribute < ActiveRecord::Migration[5.0]
  def up
    change_column :reservations, :confirmed, :boolean, :default => false
  end

  def down
    change_column :reservations, :confirmed, :boolean, :default => nil
  end
end
