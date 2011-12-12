Foodbase::Application.routes.draw do
  get "home/index"

  resources :fooditems

  root :to => 'fooditems#index'

end
