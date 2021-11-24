Rails.application.routes.draw do
  resources :categories
  # resources :games

  # get '/articles' => 'articles#index'
  # get '/articles/new' => 'articles#new', as: 'new_article'
  # post 'articles' => 'articles#create', as: 'create_article'
  get '/' => 'categories#index'
  # get '/categories/new' => 'categories#new', as: 'new_category'
  # get '/categories/:id' => 'categories#show', as: 'show_category'
end
