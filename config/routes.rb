Rails.application.routes.draw do
  resources :sub_tasks
  resources :tasks do
    get 'tasks/sub_task/:id', to: 'sub_tasks#index'
    get 'tasks/sub_task/new', to: 'sub_tasks#new'
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
