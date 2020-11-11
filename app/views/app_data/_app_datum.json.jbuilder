json.extract! app_datum, :id, :app_id, :app_type, :monthly_revenue, :monthly_downloads, :date_collected, :created_at, :updated_at
json.url app_datum_url(app_datum, format: :json)
