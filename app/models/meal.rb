class Meal < ApplicationRecord
    validates_presence_of :meal, :description
end
