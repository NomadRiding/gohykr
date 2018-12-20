Rails.application.routes.draw do
  resources :itineraries
  get 'sessions/new'
  resources :users
  resources :sessions
  get 'hello_world', to: 'hello_world#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/events', to:'events#index'
  get '/search', to:'events#search'
  post 'message', to: 'messages#create'
  get '/chatrooms', to: 'chatrooms#index'
  get '/postaride', to: 'itineraries#new', as: 'postaride'
  root 'hello_world#index'
end
