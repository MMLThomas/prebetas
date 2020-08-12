Rails.application.routes.draw do

  root "application#home"
  get '/search' => "application#search"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  post '/logout' => "sessions#destroy"

  scope "/users" do
    resources :projects, only: [:new]
  end

  resources :enrollments, only: [:create, :destroy]
  resources :categories
  resources :comments, only: [:create, :destroy]
  resources :projects
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
