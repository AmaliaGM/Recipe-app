class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.where(public: true)
  end
end
