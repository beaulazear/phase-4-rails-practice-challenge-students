Rails.application.routes.draw do
  resources :instructors, only: [:index, :update, :destroy, :create]
  resources :students, only: [:index, :update, :destroy, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
