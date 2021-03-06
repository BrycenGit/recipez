class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    render :index
  end

  def new
    if params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = @recipe.ingredients.new
    else
      @ingredient = Ingredient.new
    end
    render :new
  end

  def create
    if params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = @recipe.ingredients.new(ingredient_params)
      if @ingredient.save
        @recipe.ingredients << @ingredient
        puts @recipe.ingredients
        flash[:notice] = "Ingredient successfully added!"
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
    else
      @ingredient = Ingredient.create(ingredient_params)
      if @ingredient.save
        flash[:notice] = "Ingredient successfully added!"
        redirect_to ingredients_path
      else
        render :new
      end
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    render :edit
  end

  def show
    if params[:name_search]
      @recipe = false
      @ingredient = Ingredient.find(params[:id])
      if params[:name_search] != ""
        @search_results = Recipe.search(params[:name_search])
        render :show
      else
        flash[:notice] = "please enter a search query!"
        @search_results = false
        render :show
      end
    elsif params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @ingredient = Ingredient.find(params[:id])
      render :show
    elsif params[:id]
      @recipe = false
      @ingredient = Ingredient.find(params[:id])
      render :show
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
      flash[:notice] = "ingredient successfully updated!"
      if params[:recipe_id]
        @recipe = Recipe.find(params[:recipe_id].to_i)
        redirect_to recipe_path(@ingredient.recipe)
      else
        redirect_to ingredient_path(@ingredients)
      end
    else
      render :edit
    end
  end

  def destroy
      @ingredient = Ingredient.find(params[:id])
      @ingredient.destroy
      flash[:notice] = "ingredient successfully deleted!"
      if params[:recipe_id]
        @recipe = Recipe.find(params[:recipe_id])
        redirect_to recipe_path(@recipe)
      else
        redirect_to ingredients_path
      end
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end