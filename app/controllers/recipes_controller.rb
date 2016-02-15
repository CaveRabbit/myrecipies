class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 8)
   # @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
  end
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(1)
    
    if @recipe.save
      flash[:success] = "You created a recipe!"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was updated sucessfully!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def like
    @recipe = Recipe.find(params[:id]) #pulling the recipe and params to create the like
    like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe) #passing in Like to the recipe
    if like.valid?
      flash[:success] = "Thanks for the Like!" #flash message
      redirect_to :back
    else
      flash[:danger] = "Nice try, one Like per recipe."
      redirect_to :back
    end
  end
  
  private
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
  
end
