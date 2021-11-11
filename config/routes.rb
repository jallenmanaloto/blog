Rails.application.routes.draw do
  resources :games

  get '/articles' => 'articles#index'
  get '/arcticles/new' => 'articles#new', as: 'new_article'
  post 'articles' => 'articles#create', as: 'create_article'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
