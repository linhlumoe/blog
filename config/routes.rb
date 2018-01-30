Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :registrations, only: [:index]
  resources :comments, only: [:create, :destroy]
  resources :articles
  get '/list-article', to: 'articles#list', as: 'article_list'
  get '/list-memory', to: 'timelines#list', as: 'memory_list'
  resources :timelines
  root 'pages#home'
end
