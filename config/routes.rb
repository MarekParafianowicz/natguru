Rails.application.routes.draw do
  
  resources :students do
    get :subjects
  end

  resources :teachers do
    get :subjects
  end
  
  resources :visitors, only: [:index]

  get 'subjects', to: 'reports#subjects', as: 'report_subcjects'
  
  devise_for :users

end
