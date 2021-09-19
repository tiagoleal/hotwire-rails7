Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :products
  resources :shopping_carts
end
