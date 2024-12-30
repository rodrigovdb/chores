# frozen_string_literal: true

Rails.application.routes.draw do
  get 'kid_chores/create'
  get 'kid_chores/update'
  resources :kids
  resources :daily_chores
  resources :chores
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Defines the root path route ("/")
  root 'daily_chores#index'
end
