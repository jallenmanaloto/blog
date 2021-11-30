Rails.application.routes.draw do
    
  resources :categories do
    resources :tasks
  end
  resources :articles do
    resources :comments
  end
end
