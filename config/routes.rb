Rails.application.routes.draw do
  get 'patron/index'
  get 'administrator/index'
  # get 'homepage/index'
  resources :books
  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
