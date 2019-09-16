# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  get 'juniors', to: 'developers#index'
  get 'projects', to: 'projects#index'

  resources :projects
  resources :repositories

  authenticated :user do
    root 'projects#index'
  end

  root 'welcome#index'
end
