json.extract! user, :id, :email, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
