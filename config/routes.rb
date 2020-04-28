Rails.application.routes.draw do
  namespace :collections do
    get 'products/show'
  end
  get 'collections/show'
  root :to => 'home#index'
  mount ShopifyApp::Engine, at: '/'

  resources :collections, only: :show, param: :type do
    resources :products, only: :show, param: :guid, controller: 'collections/products'
  end

  resources :cart_items, only: :create
end
