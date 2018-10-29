class RenameAttributeInRoutes < ActiveRecord::Migration[5.1]
  def change
  	rename_column :routes, :arrival_point_string, :arrival_point
  end
end
