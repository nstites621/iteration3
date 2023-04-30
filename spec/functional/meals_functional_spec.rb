require "rails_helper"

RSpec.describe MealsController, :type => :controller do
    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index
            expect(response).to have_http_status(:ok)
            end
        end

        context "GET #show" do
            let!(:meal) { Meal.create(meal: "Test meal", description: "Test description") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
    end
end
