Rails.application.routes.draw do
  resources :gardens, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
