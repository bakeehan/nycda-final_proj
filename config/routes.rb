Rails.application.routes.draw do

  root "brackets#index"
  
  get 'user/:id' => "users#show"
  get 'journeys' => "users#index"

  resources :brackets
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'students' => "teacher#index"
  get 'student/assignments/:id' => "teacher#show"

  get 'admin' => "admin#index"

  get 'assignments' => "student#index"
  get 'comments' => "student#feedback"

end
