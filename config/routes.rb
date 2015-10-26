Rails.application.routes.draw do
  # namespace :api do
    # resources :users, only: [:index, :show, :create, :new]
  # end
    # resources :sessions, only: [:new, :create]
    # get '/' => 'sessions#new', as: :new_session

  get '/' => 'sessions#new', as: :new_session
  get 'users/new' => 'users#new', as: :new_user
  # get 'users/index' => 'users#index' as: :home_page
  post 'users/login' => 'sessions#create', as: :create_session
  post 'users/create' => 'users#create', as: :users
end
