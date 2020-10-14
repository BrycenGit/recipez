require 'rails_helper'

describe IngredientRecipe do
  it { should belong_to(:ingredient) }
  it { should belong_to(:recipe) }
end