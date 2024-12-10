Rails.application.routes.draw do
  # Devise routes for User model
  devise_for :users

  # Root route to pages#home
  root "pages#home"

  # Profile: edit/update current user’s profile
  resource :profile, only: [:edit, :update]

  # Directory listing of other users (for searching and requesting pals)
  resources :users, only: [:index]

  # Pal requests for mentorship/pal connections
  resources :pal_requests, only: [:index, :create, :update]
end


  