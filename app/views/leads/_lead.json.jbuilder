json.extract! lead, :id, :email, :name, :created_at, :updated_at
json.url lead_url(lead, format: :json)
