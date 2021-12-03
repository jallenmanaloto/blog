Rails.application.routes.draw do
    
  devise_for :users
  resources :categories do
    resources :tasks
  end
  resources :articles do
    resources :comments
  end

  root to: 'categories#index'
end
