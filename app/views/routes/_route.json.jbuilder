json.extract! route, :id, :departure_point, :arrival_point_string, :departure_time, :estimated_arrival_time, :place_number, :price, :animal_permission, :smoker_permission, :luggage, :user_id, :created_at, :updated_at
json.url route_url(route, format: :json)
