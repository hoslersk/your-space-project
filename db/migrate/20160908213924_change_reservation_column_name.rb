class ChangeReservationColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :reservations, :confirmed?, :confirmed
  end
end
