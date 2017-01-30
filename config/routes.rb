Rails.application.routes.draw do

  devise_for :users

  root "pages#home"

  resources :products

  get "my_products" => "products#my_products"

end
