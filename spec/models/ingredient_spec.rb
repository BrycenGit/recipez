require 'rails_helper'

describe Ingredient do
  it { should have_many(:recipes).through(:ingredient_recipes) }
end