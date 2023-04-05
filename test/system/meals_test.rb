require "application_system_test_case"

class MealsTest < ApplicationSystemTestCase
  setup do
    @meal = meals(:one)
  end

  test "visiting the index" do
    visit meals_url
    assert_selector "h1", text: "Meals"
  end

  test "creating a Meal" do
    visit meals_url
    click_on "New Meal"

    fill_in "Calories", with: @meal.calories
    fill_in "Carbs", with: @meal.carbs
    fill_in "Consumed", with: @meal.consumed
    fill_in "Description", with: @meal.description
    fill_in "Fats", with: @meal.fats
    fill_in "Meal", with: @meal.meal
    fill_in "Protein", with: @meal.protein
    click_on "Create Meal"

    assert_text "Meal was successfully created"
    click_on "Back"
  end

  test "updating a Meal" do
    visit meals_url
    click_on "Edit", match: :first

    fill_in "Calories", with: @meal.calories
    fill_in "Carbs", with: @meal.carbs
    fill_in "Consumed", with: @meal.consumed
    fill_in "Description", with: @meal.description
    fill_in "Fats", with: @meal.fats
    fill_in "Meal", with: @meal.meal
    fill_in "Protein", with: @meal.protein
    click_on "Update Meal"

    assert_text "Meal was successfully updated"
    click_on "Back"
  end

  test "destroying a Meal" do
    visit meals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meal was successfully destroyed"
  end
end
