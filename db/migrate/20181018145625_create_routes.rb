class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :departure_point
      t.string :arrival_point_string
      t.datetime :departure_time
      t.datetime :estimated_arrival_time
      t.integer :place_number
      t.float :price
      t.boolean :animal_permission
      t.boolean :smoker_permission
      t.boolean :luggage
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
