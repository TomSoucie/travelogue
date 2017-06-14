Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  namespace :admin do
    resources :categories, only: [:new, :create, :index]
    resources :images, only: [:new, :create]
  end

  resources :images, only: [:index, :show]

  resources :ideas
end
