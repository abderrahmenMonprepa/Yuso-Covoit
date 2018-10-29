class AddPassengerToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :passenger_or_conducter, :string
  end
end
