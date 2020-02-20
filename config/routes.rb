Rails.application.routes.draw do
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  root  'departments#index'
  resources :departments
end
