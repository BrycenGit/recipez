class Recipe < ApplicationRecord
  
  scope :five_star, -> { where(rating: 5).limit(5) }
  scope :search, -> (name_parameter) { where("LOWER(name) like ?", "%#{name_parameter.downcase}%") }
  
  validates :name, presence: true
  has_many :ingredient_recipes
  has_many :ingredients, :through => :ingredient_recipes

  has_many :recipe_tags
  has_many :tags, :through => :recipe_tags
end

# if params[:name_search]
# upcase_results = Recipe.search(params[:name_search].capitalize)
# downcase_results = Recipe.search(params[:name_search].downcase)
# @results = upcase_results + downcase_results
# @search = true
# render :index