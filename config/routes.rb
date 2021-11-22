Rails.application.routes.draw do
  resources :categories
  resources :games
# get '/articles' => 'articles#index'
# get '/articles/new' => 'articles#new', as: 'new_article'
# post 'articles' => 'articles#create', as: 'create_article'
# get '/category' => 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
