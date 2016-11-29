Rails.application.routes.draw do
  resources :students do
    get :subjects
  end
  devise_for :users

  resources :visitors, only: [:index]
end
