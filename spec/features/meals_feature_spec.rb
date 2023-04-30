require "rails_helper"

RSpec.feature "Meals", type: :feature do

  context "Create new meal" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit new_meal_path
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      fill_in "Meal", with: "Test meal"
      fill_in "Calories", with: "120"
      fill_in "Fats", with: "3"
      fill_in "Protein", with: "10"
      fill_in "Carbs", with: "5"
      click_button "Create Meal"
      expect(page).to have_content("Meal was successfully created")
    end

    scenario "should fail" do
      fill_in "Meal", with: "Test Meal"
      fill_in "Description", with: ""
      click_button "Create Meal"
      expect(page).to have_content("Description can't be blank")
    end

    scenario "should fail" do
      fill_in "Meal", with: ""
      fill_in "Description", with: "Test description"
      click_button "Create Meal"
      expect(page).to have_content("Meal can't be blank")
    end
  end

  context "Update meal" do
    let(:meal) { Meal.create(meal: "Test meal", description: "Test content") }
     before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_meal_path(meal)
    end

    scenario "should be successful" do
        within("form") do
          fill_in "Meal", with: "New meal content"
        end
        click_button "Update Meal"
        expect(page).to have_content("Meal was successfully updated")
    end
 
 
    scenario "should fail" do
        within("form") do
          fill_in "Meal", with: ""
        end
        click_button "Update Meal"
        expect(page).to have_content("Meal can't be blank")
    end
 
    scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Meal"
        expect(page).to have_content("Meal was successfully updated")
    end
 
    scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Meal"
        expect(page).to have_content("Description can't be blank")
    end

    scenario "should be successful" do
        visit new_meal_path
        within("form") do
          fill_in "Meal", with: "New project meal"
          fill_in "Description", with: "New project description"
        end
        click_button "Create Meal"
        expect(page).to have_content("Meal was successfully created.")
      end
  end

  context "Login" do
    scenario "should sign up" do
        visit root_path
        click_link 'Sign up'
        within("form") do
          fill_in "Email", with: "testing@test.com"
          fill_in "Password", with: "123456"
          fill_in "Password confirmation", with: "123456"
          click_button "Sign up"
        end
        expect(page).to have_content("Welcome! You have signed up successfully.")
    end

      scenario "should log in" do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        expect(page).to have_content("Logged in")
      end
  end
end
