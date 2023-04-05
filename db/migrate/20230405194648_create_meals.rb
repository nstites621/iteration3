class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.string :meal
      t.text :description
      t.integer :calories
      t.integer :fats
      t.integer :protein
      t.integer :carbs
      t.date :consumed

      t.timestamps
    end
  end
end
