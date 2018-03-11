Rails.application.routes.draw do

  root 'todo_lists#show', {id: 1}

  resources :todo_lists do
    resources :tasks do
      member do 
        patch :completed
      end
    end
  end
end
