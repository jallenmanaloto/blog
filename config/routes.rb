Rails.application.routes.draw do
  resources :categories
  resources :articles do
    resources :comments
  end

  get '/' => 'categories#index'
end
