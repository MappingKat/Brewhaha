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

end
