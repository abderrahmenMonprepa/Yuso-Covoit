class AddCommentToRoutes < ActiveRecord::Migration[5.1]
  def change
  	add_reference :user_comments, :route, index: true
  end
end
