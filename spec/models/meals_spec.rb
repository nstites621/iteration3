require "rails_helper"


describe "Meal Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "ensures the meal is present when creating meal" do
      meal = Meal.new(description: "Content of the description")
      expect(meal.valid?).to eq(false)
    end
    it "should not be able to save project when description missing" do
      meal = Meal.new(description: "Some description content goes here")
      expect(meal.save).to eq(false)
    end
    it "should not be able to save project when meal missing" do
        meal = Meal.new(meal: "Some meal content goes here")
        expect(meal.save).to eq(false)
      end
    it "should be able to save project when have description and title" do
      meal = Meal.new(meal: "Meal", description: "Content of the description")
      expect(meal.save).to eq(true)
    end
  end
end


describe "Meal Attribute Requirements on Edit", :type => :model do
  context "Edit meal" do  
    before (:each) do
      @meal = Meal.create(meal: "Meal", description: "Content of the description")
 
      end
    it "ensures the meal is present when editing meal" do
      @meal.update(:meal => "New Meal")
      expect(@meal.meal == "New Meal")
    end

    it "ensures the description is present when editing meal" do
        @meal.update(:description => "New description")
        expect(@meal.description == "New description")
      end
  end
end
