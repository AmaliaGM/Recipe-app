class RecipeFoodsController < ApplicationController
     before_action :authenticate_user!
   
     def new
       @recipe = Recipe.find(params[:recipe_id])
       @recipe_food = @recipe.recipe_foods.new
     end
   
     def create
       @recipe = Recipe.find(params[:recipe_id])
       @recipe_food = @recipe.recipe_foods.create(recipe_foods_params)
       if @recipe_food.save
         flash[:notice] = 'Food created sucessfully.'
         redirect_to @recipe
       else
         render :new
       end
     end
   
     def edit
       @recipe_food = RecipeFood.find(params[:id])
     end
   
     def update
       @recipe_food = RecipeFood.find(params[:id])
       if @recipe_food.update(recipe_foods_params)
         flash[:success] = 'Recipe Food updated successfully.'
       else
         flash[:error] = 'Could not add'
       end
       redirect_to recipe_path(@recipe_food.recipe_id)
     end
   
     def destroy
       @recipe_food = RecipeFood.find(params[:id])
       @recipe_food.destroy
       flash[:success] = 'Recipe Food deleted successfully.'
       redirect_to recipe_path(@recipe_food.recipe_id)
     end
   
     private
   
     def recipe_foods_params
       params.require(:recipe_food).permit(:quantity, :food_id)
     end
   end
   