Rails.application.routes.draw do
  # namespace :api do
    resources :users, only: [:index, :show, :create, :new]
  # end
    get '/' => 'sessions#new', as: :new_session
end
