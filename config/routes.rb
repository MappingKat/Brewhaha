Brewhaha::Application.routes.draw do
  root to: 'categories#index'
  resources :categories do
    collection do
      get "edit_all"
    end
  end

  resources :items
  resources :customers
  resources :admin
  #get 'admin', to: 'admin#index', as: admin
  resources :admin_orders
  #post 'admin', to:admin_orders#index, as: admin_orders

  get 'auth/twitter/callback', to: 'sessions#create'
  # here is the omniauth callback route, which would be agnostic to provider
  # get '/auth/:provider/callback', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy', as: :signout
  get 'auth/failure', to: redirect('/') #may want to add error msg

  #cart routes
  post 'carts/add/:id', to: 'carts#add', as: :add_item_to_cart
  post 'carts/subtract/:id', to: 'carts#subtract', as: :subtract_item_from_cart
  post 'carts/delete/:id', to: 'carts#delete', as: :delete_item_from_cart
  post 'carts/clear', to: 'carts#destroy', as: :clear_cart
  get 'carts/review', to: 'carts#review', as: :review_cart

  #order routes
  get 'orders', to: 'orders#index', as: :orders
  post 'orders', to: 'orders#create'
  get 'orders/new', to: 'orders#new', as: :new_order
  get 'orders/:id/edit', to: 'orders#edit', as: :edit_order
  get 'orders/:id', to: 'orders#show', as: :order
  put 'orders/:id', to: 'orders#update'
  delete 'orders/:id', to: 'orders#destroy'
  get 'orders/:id/confirm', to: 'orders#confirm', as: :confirm_order
  get 'orders/:id/pay', to: 'orders#pay', as: :pay_for_order
  get 'orders/:id/complete', to: 'orders#complete', as: :complete_order

  get 'about', to: 'static_pages#about', as: :about
end
