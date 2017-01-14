json.extract! key_donor, :id, :relationship, :Students_id, :Donor_id, :donation_id, :created_at, :updated_at
json.url key_donor_url(key_donor, format: :json)