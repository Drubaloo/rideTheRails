Rails.application.routes.draw do
  get 'comment/index'
  get 'post/index'
  get 'pokemon/index'
  get 'user/index'
  
  # Defines the root path route ("/")
  get '/api/csrf_token', to: 'application#get_csrf_token'
  

  post 'login', to: 'sessions#create', as: :login
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  delete "/logout", to: "sessions#destroy", as: "logout"
  
  root "rings#index"
  
  resources :rings
  resources :users
  resources :pokemon
  resources :posts
  resources :coments
end
