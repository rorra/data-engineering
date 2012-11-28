DataEngineering::Application.routes.draw do
  devise_for :users

  resources :merchants, only: :index do
    resources :products, only: :index
    resources :sales, only: :index
  end

  resources :products, only: :index do
    resources :sales
  end

  resources :sales, only: :index

  match 'process-file', to: 'home#process_file', as: :process_file

  root to: 'home#index'
end
