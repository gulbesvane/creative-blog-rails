Rails.application.routes.draw do
  root 'pages#home'
  get 'manager', to: 'pages#manager'
  # make index, show, new, create, edit, update and destroy routes available (REST-ful routes)
  resources :articles
  # create paths for contact
  resources :contacts
end
