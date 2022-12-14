Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/profile', to: 'users#profile'
  resources :users
  post '/login', to: 'authentication#login'
  delete '/logout', to: 'authentication#logout'
  post 'movies/:id/categories', to: 'movies#add_category'
  delete 'movies/:id/categories', to: 'movies#remove_category'
  resources :categories
  resources :movies
end
