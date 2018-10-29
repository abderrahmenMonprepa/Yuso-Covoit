json.extract! message, :id, :message_content, :route_id, :created_at, :updated_at
json.url message_url(message, format: :json)
