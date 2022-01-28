# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :backoffice do
    root to: 'pages#index'

    resources :products
    resources :categories
  end

  resources :products, only: %i[index show]
  resources :categories, only: %i[index show]

  get 'pages/profile', to: 'pages#profile', as: :profile
  root to: 'pages#index'
end
