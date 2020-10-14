class Recipe < ApplicationRecord
  has_many :ingredient_recipes
  has_many :ingredients, :through => :ingredient_recipes

  has_many :recipe_tags
  has_many :tags, :through => :recipe_tags
end