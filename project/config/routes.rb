Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, except: [:new, :edit] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks, except: [:new, :edit, :index] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]



  # Defines the root path route ("/")
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/users', to: 'users#index', as: 'users'
  # post '/users', to: 'users#create'
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users/:id', to: 'users#edit', as: 'edit_user'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'
  # root "articles#index"
end
