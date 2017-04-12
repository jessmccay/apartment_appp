require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context "Landing Page" do
    Steps "to visiting the website" do
      Given "I am on the landing page" do
        visit '/'
      end

      Then "I am asked to register" do
        expect(page).to have_content "Log in"
        click_on "Sign up"
        fill_in "Email", with: "mrin@sin.com"
        fill_in "Password", with: "mrinsin"
        fill_in "Password confirmation", with: "mrinsin"
        click_on "Sign up"
      end
      Then "I can create a new apartment" do
        expect(page).to have_content "Welcome! You have signed up successfully."
        click_on "New Apartment"
        fill_in "Street 1", with: "615 E 14 st"
        fill_in "City", with: "New York"
        fill_in "State", with: "NY"
        fill_in "Name", with: "Mrinalini"
        click_on "Create Apartment"
        click_on "Back"
      end
      Then "I can see a list of apartments" do
        expect(page).to have_content "Street 1"
        expect(page).to have_content "City"
        expect(page).to have_content "State"
        expect(page).to have_content "Name"
        expect(page).to have_content "Phone number"
      end
    end
  end
end
