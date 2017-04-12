require 'rails_helper'

RSpec.describe Apartment, type: :model do

  it "should have a street address with city, zip code, state, country and contact info" do

    mrin = User.new(email: "mrin@sin.com", password: "mrinsin", password_confirmation: "mrinsin")
    mrin.save
    home = Apartment.new(street_1: "615 E 14 st", city: "New York", postal_code: 10009, state: "NY", name: "Mrinalini Sinha", phone_number: 12345678, hours_to_contact: "7:00 a.m. - 1:30 p.m.", user_id: mrin.id)

    expect(home.save).to be true

  end

  it "can be saved to and retrieved from the database" do

    mrin = User.new(email: "mrin@sin.com", password: "mrinsin", password_confirmation: "mrinsin")
    mrin.save
    home = Apartment.new(street_1: "615 E 14 st", city: "New York", postal_code: 10009, state: "NY", name: "Mrinalini Sinha", phone_number: 1234, hours_to_contact: "7:00 a.m. - 1:30 p.m.", user_id: mrin.id)

    expect(home.save).to be true

    new_home = Apartment.find_by_name("Mrinalini Sinha")

    expect(new_home.city).to eq "New York"
    expect(new_home.street_1).to eq "615 E 14 st"
  end

end
