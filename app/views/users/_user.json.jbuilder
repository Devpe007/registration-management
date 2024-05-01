json.extract! user, :id, :name, :email, :phone, :passaword, :born_at, :created_at, :updated_at
json.url user_url(user, format: :json)
