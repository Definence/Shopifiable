Rails.application.routes.draw do
  # mount ShopifyApp::Engine, at: '/'
  root :to => 'home#index'

  resources :collections, only: :show, param: :type do
    resources :products, only: :show, param: :guid, controller: 'collections/products'
  end

  resources :cart_items, only: :create
end
