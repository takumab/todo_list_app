Rails.application.routes.draw do

  devise_for :users
  root 'todo_lists#new'

  resources :todo_lists do
    resources :tasks do
      member do
        patch :completed
      end
    end
  end
end
