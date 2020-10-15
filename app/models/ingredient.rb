class Ingredient < ApplicationRecord

  validates :name, presence: true
  has_many :ingredient_recipes
  has_many :recipes, :through => :ingredient_recipes
  # scope :add_to_recipe, -> (recipe) {"  ", "#{recipe.downcase}" }
  
end