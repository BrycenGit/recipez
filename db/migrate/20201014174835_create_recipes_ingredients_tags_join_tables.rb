class CreateRecipesIngredientsTagsJoinTables < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :instructions
      t.integer :rating 
      t.timestamps
    end
  
    create_table :ingredients do |t|
      t.string :name
      t.timestamps
    end

    create_table :tags do |t|
      t.string :category
      t.timestamps
    end
  
    create_table :ingredient_recipes do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true
      t.timestamps
    end

    create_table :recipe_tags do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :tag, index: true
      t.timestamps
    end
  
  
  end
end
