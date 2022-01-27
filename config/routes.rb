Rails.application.routes.draw do
  resources :products
  resources :categories
  devise_for :admins
  devise_for :users

  namespace :backoffice do
    root to: "pages#index"
  end

  get "pages/profile", to: "pages#profile", as: :profile
  root to: "pages#index"
end
