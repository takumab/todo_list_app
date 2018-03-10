Rails.application.routes.draw do

  root 'todo_lists#new'

  resources :todo_lists
end
