Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :admin do
    resources :categories, only: [:new, :create, :index]
  end
  
end
