Rails.application.routes.draw do
  get 'patron/index'
  get 'administrator/index'
  # get 'homepage/index'
  get '/checkout/', to: "books#checkout"
  resources :books
  get '/addreview/', to: "books#addreview"
  root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
