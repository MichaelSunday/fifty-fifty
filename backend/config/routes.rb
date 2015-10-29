Rails.application.routes.draw do
  # devise_for :users
  # namespace :api do
    # resources :users, only: [:index, :show, :create, :new]
  # end
    # resources :sessions, only: [:new, :create]
    # get '/' => 'sessions#new', as: :new_session





  post '/' => 'sessions#new', as: :new_session
  get 'users/new' => 'users#new', as: :new_user
  get 'users/index' => 'users#index', as: :home_page
  post 'users/login' => 'sessions#create', as: :create_session  
  post 'users/create' => 'users#create', as: :users
  get '/auth/spotify/callback', to: 'users#spotify'
  get '/genres' => 'genres#index', as: :homepage
  post '/tracks/:genre' => 'tracks#index', as: :music_player
  post '/likes' => 'likes#index', as: :likes_table
  post '/dislikes' => 'dislikes#index', as: :dislikes_table
  post '/artists' => 'artists#index', as: :artists_table
  post 'auth' => 'auth#authenticate'
end
