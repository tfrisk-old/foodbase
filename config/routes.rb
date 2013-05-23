Foodbase::Application.routes.draw do
  get "home/index"

  resources :fooditems do
    resources :manufacturers
  end
  resources :ingredients do
    resources :fooditems_ingredients
  end

  resources :manufacturers do
    resources :fooditems
  end

  resources :fooditems
  root :to => 'fooditems#index'

end
