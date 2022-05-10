Rails.application.routes.draw do
  root 'pages#home'
  get 'manager', to: 'pages#manager'
  get 'contact', to: 'pages#contact'
  # make index, show, new, create, edit, update and destroy routes available (REST-ful routes)
  resources :articles
end
