Rails.application.routes.draw do
  get 'pal_requests/index'
  get 'pal_requests/update'
  get 'pal_requests/create'
  get 'users/index'
  get 'profiles/edit'
  get 'profiles/update'
  get 'pages/home'
  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

   # root route
   root "pages#home"

   resource :profile, only: [:edit, :update]
   resources :users, only: [:index]
   resources :pal_requests, only: [:index, :create, :update]


end
