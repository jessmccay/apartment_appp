require 'rails_helper'
load "db/seeds.rb"

RSpec.feature "LandingPages", type: :feature do
  context "Landing Page" do
    Steps "to visiting the website" do
      Given "I am visiting the site" do
        visit '/'
      end

      Then "I can see all apartments" do
        expect(page).to have_content "View all apartments"
        expect(page).to_not have_content "Create Apartment"
      end

      And "I can register and login" do
        click_on "Login"
        click_on "Sign up"
        fill_in "Email", with: "mrin@sin.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end

    end
  end
end
