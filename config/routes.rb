Rails.application.routes.draw do
  resources :coupons
  get 'coupons/token/:token', to: 'coupons#find_by_token', as: 'find_by_token'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :order_products
  resources :orders
  # resources :carts
  resources :products
  resources :categories
  resources :brands

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end
  get 'manager/products', to: 'products#manage_index', as: 'products_management'
  get 'manager/products/:id', to: 'products#management_show', as: 'product_management'
  devise_for :users

  root to: 'products#index'
end
