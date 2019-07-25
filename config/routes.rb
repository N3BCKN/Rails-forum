# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  post 'users/update'

  get '/categories/:id' => 'categories#show', :as => 'category'
  get '/subject/:id' => 'subjects#show', :as => 'subject'
  get '/discussion/:id' => 'discussions#show', :as => 'discussion'
  get 'search', to: 'discussions#search'
  get '/faq', to: 'pages#faq'

  resources :users, only: %i[edit update]
  resources :personal_messages, only: %i[create new]
  resources :conversations, only: %i[index show]

  resources :profiles do
    member do
      put 'bans/update'
    end
  end

  resources :discussions do
    member do
      resources :posts
    end
  end

  root to: 'pages#index'
end
