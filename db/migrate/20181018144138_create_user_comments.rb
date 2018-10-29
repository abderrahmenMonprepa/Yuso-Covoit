class CreateUserComments < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comments do |t|
      t.text :content
      t.string :comment_validation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
