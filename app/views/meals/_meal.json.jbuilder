json.extract! meal, :id, :meal, :description, :calories, :fats, :protein, :carbs, :consumed, :created_at, :updated_at
json.url meal_url(meal, format: :json)
