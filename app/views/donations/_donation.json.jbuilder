json.extract! donation, :id, :date, :amount, :note, :created_at, :updated_at
json.url donation_url(donation, format: :json)