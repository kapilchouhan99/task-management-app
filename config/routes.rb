Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "tasks#index"
  resources :tasks do
    member do
      patch 'update_status'
    end
  end
end
