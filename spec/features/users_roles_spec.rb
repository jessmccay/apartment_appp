require 'rails_helper'

RSpec.feature "UsersRoles", type: :feature do
  context "CRUD on apartments" do
    Steps "to creating and managing an apartment" do

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

      Then "I can create a new apartment" do
        click_on "New Apartment"
        fill_in "Street 1", with: "G-15/10 DLF Phase 1"
        fill_in "City", with: "Gurgaon"
        fill_in "Name", with: "Mrinalini Sinha"
        click_on "Create Apartment"
      end

      And "I can edit or delete the apartment I have created" do
        expect(page).to have_content "Edit"
        expect(page).to have_content "Destroy"
      end

      Then "I can log out" do
        click_on "Logout"
      end

      Then "somebody else can sign up" do
        click_on "Login"
        click_on "Sign up"
        fill_in "Email", with: "stinky@butt.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_on "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end

      And "They can see any apartment listing" do
        expect(page).to have_content("Mrinalini Sinha")
        click_on "G-15/10 DLF Phase 1"
      end

      And "I cannot delete or edit what I have not created"  do
        expect(page).to_not have_content("Edit")
        expect(page).to_not have_content("Destroy")git 
      end
    end
  end
end
