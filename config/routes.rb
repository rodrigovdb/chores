# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :kids
  resources :daily_chores
  resources :chores

  # Defines the root path route ("/")
  root 'daily_chores#index'
end
