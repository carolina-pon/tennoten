Rails.application.routes.draw do
  root 'works#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: %i[index]
  resources :authors, only: %i[index new create edit update destroy]
  resources :works
end
