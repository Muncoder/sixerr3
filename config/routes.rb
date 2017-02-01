Rails.application.routes.draw do

  devise_for :users

  root "pages#home"

  resources :products

  get "my_products" => "products#my_products"

  resources :charges, only:[:new, :create]

  get "sales" => "products#sales"
  get "purchases" => "products#purchases"

end