Rails.application.routes.draw do
  get 'brackets/index'
  get 'brackets/new'
  get 'brackets/show'
  get 'brackets/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "brackets#index"
end
