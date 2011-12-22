CoffeeChat::Application.routes.draw do
  get "authentications/index"

  get "authentications/create"

  get "authentications/destroy"

  get "sessions/new"

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/auth/:provider/callback', :to => 'authentications#create'
  
  root :to => 'pages#home'
end
