class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :message_content
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
