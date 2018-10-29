class AddPlaceNbrToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :place_nbr, :integer
  end
end
