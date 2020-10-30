Rails.application.routes.draw do

  root "application#home"
  get '/search' => "application#search"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"
  get '/auth/:provider/callback' => 'sessions#omniauth'


  
  
  
  resources :projects do 
    resources :comments
  end

  resources :users do 
    resources :enrollments, only: [:index]
  end
  
  resources :categories
  resources :enrollments, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
