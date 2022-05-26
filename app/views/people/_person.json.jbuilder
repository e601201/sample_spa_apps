json.extract! person, :id, :email, :crypted_password, :salt, :created_at, :updated_at
json.url person_url(person, format: :json)
