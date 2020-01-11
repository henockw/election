Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :candidates, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  namespace :admin do
    resources :candidates, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
