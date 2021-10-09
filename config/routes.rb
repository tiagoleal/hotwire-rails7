Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :products
  resources :shopping_carts, only: [:index, :show, :new, :edit] do
    delete 'product/:product_id', to: 'shopping_carts#destroy', as: 'destroy'
    collection do
      post :search
    end
  end
  get '/', to: 'dashboards#index'
end
