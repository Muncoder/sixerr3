Rails.application.routes.draw do

  devise_for :users

  root "pages#home"

  resources :products do
  	resources :reviews, only: [ :create, :destroy ]
  end

  get "my_products" => "products#my_products"

  resources :charges, only:[:new, :create]

  get "sales" => "products#sales"
  get "purchases" => "products#purchases"
  get "search" => "pages#search"

  resources :contacts, only: [:new, :create]

end