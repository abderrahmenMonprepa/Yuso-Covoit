class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :test_name
      t.text :test_category
      t.datetime :test_date
      t.float :test_number

      t.timestamps
    end
  end
end
