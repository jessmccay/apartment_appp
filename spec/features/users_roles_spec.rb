require 'rails_helper'

RSpec.feature "UsersRoles", type: :feature do
  context "CRUD on apartments" do
    Steps "to creating and managing an apartment" do

      Given "I am visiting the site" do
        visit '/'
      end

      Then "I can see all apartments" do
        expect(page).to have_content "View all apartments"
        expect(page).to have_content "Bushwick Beauty"
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
        expect(page).to_not have_content("Destroy")
      end

    end #end steps
  end #end context

  context "Admin Role" do
    Steps "to carrying out admin duties" do
      admin = User.new(email: "mrin@mrin.com", password: "password")
      admin.save
      admin.add_role :admin

      Given "I am logged in as an admin" do
        visit '/'
        click_on "Login"
        fill_in "Email", with: "mrin@mrin.com"
        fill_in "Password", with: "password"
        click_on "Log in"
      end

      Then "I can visit the admin page" do
        visit '/admin/index'
        expect(page).to have_content("Role")
        expect(page).to have_content("Users")
      end

      And "I am able to make someone else and admin" do
        click_on('Make Admin', match: :first)
      end
    end
  end
end #end rspec
