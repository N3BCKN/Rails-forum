Rails.application.routes.draw do
 
  post 'users/update'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :users, only: [:edit, :update]
  get "/categories/:id" => "categories#show", :as => "category"
  get "/subject/:id" => "subjects#show", :as => "subject"
  get "/discussion/:id" => "discussions#show", :as => "discussion"
  resources :profiles
  resources :pages
  resources :discussions do
  	member do
  	resources :posts
  	end
  end

  root to: "pages#index"
end
