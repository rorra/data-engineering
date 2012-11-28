DataEngineering::Application.routes.draw do
  devise_for :users

  resources :merchants, only: :index do
    resources :products, only: :index
    resources :sales, only: :index
  end

  resources :products, only: :index

  resources :sales, only: :index

  root to: 'home#index'
end
