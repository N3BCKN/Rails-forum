Rails.application.routes.draw do
  
  
  get "/categories/:id" => "categories#show", :as => "category"
  get "/subject/:id" => "subjects#show", :as => "subject"
  get "/discussion/:id" => "discussions#show", :as => "discussion"
  resources :pages
  resources :discussions

  root to: "pages#index"
end
