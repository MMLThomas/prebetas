Rails.application.routes.draw do

  root "application#home"
  get '/search' => "application#search"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => 'sessions#omniauth'

  scope "/users" do
    resources :projects, only: [:new]
  end

  resources :enrollments, only: [:create, :destroy]
  resources :categories
  
  resources :projects do 
    resources :comments
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
