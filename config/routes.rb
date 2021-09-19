Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :tweets
  resources :products
  resources :shopping_carts

  get 'dashboards', to: 'dashboards#index'
end
