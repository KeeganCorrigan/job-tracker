Rails.application.routes.draw do

  resources :dashboard, only: [:index]

  resources :categories

  resources :jobs do
    resources :comments
  end

  resources :comments, only: [:index, :create]

  resources :companies do
    resources :contacts, exclude: [:show]
  end
end
