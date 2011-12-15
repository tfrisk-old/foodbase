Foodbase::Application.routes.draw do
  get "home/index"

  resources :fooditems
  resources :ingredients do
    resources :fooditems_ingredients
  end

  root :to => 'fooditems#index'

end
