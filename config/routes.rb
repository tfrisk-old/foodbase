Foodbase::Application.routes.draw do
  get "home/index"

  resources :fooditems
  resources :ingredients do
    resources :fooditems_ingredients
  end
  resources :manufacturers

  root :to => 'fooditems#index'

end
