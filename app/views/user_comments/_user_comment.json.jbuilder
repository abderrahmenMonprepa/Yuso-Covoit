json.extract! user_comment, :id, :content, :comment_validation, :user_id, :created_at, :updated_at
json.url user_comment_url(user_comment, format: :json)
