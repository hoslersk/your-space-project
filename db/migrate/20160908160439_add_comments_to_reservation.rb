class AddCommentsToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :comment, :text
  end
end
