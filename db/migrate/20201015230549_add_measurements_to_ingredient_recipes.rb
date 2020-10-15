class AddMeasurementsToIngredientRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column(:ingredient_recipes, :measurement, :string)
  end
end
