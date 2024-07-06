# frozen_string_literal: true

Rails.application.routes.draw do
  resources :daily_chores
  devise_for :users
  resources :chores
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'daily_chores#index'
end
