class AddDepartureDateToRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :routes, :departure_date, :date
  end
end
