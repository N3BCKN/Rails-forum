Rails.application.routes.draw do
  get "/categories/:id" => "categories#show", :as => "category"
  resources :pages

  root to: "pages#index"
end
