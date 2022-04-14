Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # make index, show, new, create, edit, update and destroy routes available (REST-ful routes)
  resources :articles
end
