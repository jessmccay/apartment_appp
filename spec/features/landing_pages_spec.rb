require 'rails_helper'
load Rails.root + "db/seeds.rb"

RSpec.feature "LandingPages", type: :feature do
  context "Landing Page" do
    Steps "to visiting the website" do
      Given "I am on the landing page" do
        visit '/'
        save_and_open_page
        
      end

      Then "I can see a list of apartments" do
        expect(page).to have_content "Street 1"
        expect(page).to have_content "Name"
      end
    end
  end
end
