Rails.application.routes.draw do
 
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  get "/categories/:id" => "categories#show", :as => "category"
  get "/subject/:id" => "subjects#show", :as => "subject"
  get "/discussion/:id" => "discussions#show", :as => "discussion"
  resources :pages
  resources :discussions do
  	member do
  	resources :posts
  	end
  end

  root to: "pages#index"
end
