Rails.application.routes.draw do
  resources :follows
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/create', to: 'users#create'
  get '/me', to: 'users#me'
  patch '/update', to: 'users#change'
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
end
