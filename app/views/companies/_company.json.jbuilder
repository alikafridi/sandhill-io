json.extract! company, :id, :name, :founders, :year_founded, :linkedin_url, :headquarters, :combined_alexa, :employee_count, :type, :capital_raised, :created_at, :updated_at
json.url company_url(company, format: :json)
