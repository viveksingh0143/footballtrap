json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password, :status, :admin
  json.url user_url(user, format: :json)
end
