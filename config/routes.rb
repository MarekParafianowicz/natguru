Rails.application.routes.draw do
  root 'visitors#index'

  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end
  
  resources :visitors, only: [:index]

  get 'subjects', to: 'reports#subjects', as: 'report_subjects'
  
  devise_for :users

end
