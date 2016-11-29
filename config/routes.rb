Rails.application.routes.draw do
  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end

  devise_for :users

  resources :visitors, only: [:index]

  resources :reports, only: [:subjects]
end
