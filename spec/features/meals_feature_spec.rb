require "rails_helper"


RSpec.feature "Meals", type: :feature do
    context "Update meal" do
      let(:meal) { Meal.create(meal: "Test meal", description: "Test content") }
      before(:each) do
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
    end
end
