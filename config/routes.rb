Rails.application.routes.draw do
  get 'profiles/edit'
  get 'profiles/update'
  get 'pages/home'
  devise_for :users

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

   # root route
   root "pages#home"

   resource :profile, only: [:edit, :update]
  
end
