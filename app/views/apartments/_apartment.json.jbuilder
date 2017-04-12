json.extract! apartment, :id, :street_1, :street_2, :city, :postal_code, :state, :country, :name, :phone_number, :hours_to_contact, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)
