Rails.application.routes.draw do
 
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  post 'users/update'

  
  get "/categories/:id" => "categories#show", :as => "category"
  get "/subject/:id" => "subjects#show", :as => "subject"
  get "/discussion/:id" => "discussions#show", :as => "discussion"
  get "/faq", to: "pages#faq"

  resources :profiles
  resources :pages
  resources :users, only: [:edit, :update]
  resources :personal_messages, only: [:create, :new]
  resources :conversations, only: [:index, :show]

  resources :discussions do
  	member do
  	resources :posts
  	end
  end

  root to: "pages#index"
end
