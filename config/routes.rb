Rails.application.routes.draw do

  devise_for :users,
            :path => '',
            :path_name => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
            :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                            :registrations => 'registrations'}

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