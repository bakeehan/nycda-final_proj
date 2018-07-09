Rails.application.routes.draw do

  root "brackets#index"
  
  get 'user/:id' => "users#show"
  get 'journeys' => "student#index"
  get 'journey/:id' => "users#mentorship"

  resources :brackets

  resources :activities

  resources :achievements
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'students' => "teacher#index"

  get 'admin' => "admin#index"

  get 'assignments' => "student#index"
  get 'comments' => "student#feedback"

  post '/comment' => "comments#create"
  post '/achieve' => "achievements#create"

end
