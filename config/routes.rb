Rails.application.routes.draw do
  devise_for :users
  resources :recipes

  root "foods#index"

  resources :public_recipes
  # resources :recipe_foods

  resources :foods

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy, :update, :edit]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
