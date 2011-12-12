Foodbase::Application.routes.draw do
  get "home/index"

  resources :fooditems

  root :to => 'home#index'

end
