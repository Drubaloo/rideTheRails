Rails.application.routes.draw do
  get 'comment/index'
  get 'post/index'
  get 'pokemon/index'
  get 'user/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rings#index"
  get '/api/csrf_token', to: 'application#get_csrf_token'
  
  resources :rings
  resources :users
  resources :pokemon
  resources :posts
  resources :coments
end
