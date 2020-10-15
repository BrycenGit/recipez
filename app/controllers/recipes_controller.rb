class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    if params[:name_search]
      if params[:name_search] != ""
        @search_results = Recipe.search(params[:name_search])
      else
        flash[:notice] = "please enter a search query!"
        @search_results = false
      end
    end
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "recipe successfully added!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    if params[:ingredient_id]
      puts "hello"
      @ingredient = Ingredient.find(params[:ingredient_id].to_i)
      @recipe.ingredients << @ingredient
    end
    render :show
  end

  def update
    @recipe= Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "recipe successfully updated!"
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "recipe successfully deleted!"
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :instructions, :rating, :search)
  end

end