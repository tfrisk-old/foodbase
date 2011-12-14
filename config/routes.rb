Foodbase::Application.routes.draw do
  get "home/index"

  resources :fooditems
  resources :ingredients

  root :to => 'fooditems#index'

end
