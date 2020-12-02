Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:show, :index, :create, :update]
  resources :users, only: [:create, :index]
  resources :reviews, only: [:create, :update, :index, :show]
end
