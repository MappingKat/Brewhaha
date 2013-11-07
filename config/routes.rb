Brewhaha::Application.routes.draw do
  resources :categories
  resources :items

  resources :customers

  root to: 'categories#index'

  get 'auth/twitter/callback', to: 'sessions#create'
  # here is the omniauth callback route, which would be agnostic to provider
  # get '/auth/:provider/callback', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy', as: :signout
  get 'auth/failure', to: redirect('/') #may want to add error msg

  #cart routes
  post 'cart/add/:id', to: 'carts#add', as: :add_item_to_cart
  post 'cart/subtract/:id', to: 'carts#subtract', as: :subtract_item_from_cart
  post 'cart/delete/:id', to: 'carts#delete', as: :delete_item_from_cart
  post 'cart/clear', to: 'carts#destroy', as: :clear_cart

end
