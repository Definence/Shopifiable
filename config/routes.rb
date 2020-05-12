require 'sidekiq/web'

Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: '/'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'

  resources :collections, only: :show, param: :type do
    resources :products, only: :show, param: :guid, controller: 'collections/products'
  end

  namespace :checkouts do
    resources :line_items, only: :create
  end

  resource :cart, only: :show
end
