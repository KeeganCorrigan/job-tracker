Rails.application.routes.draw do

  resources :dashboard, only: [:index]

  resources :categories

  resources :jobs do
    resources :comments, exclude: [:show, :edit, :update, :index]
  end

  resources :companies do
    resources :contacts, exclude: [:show]
  end
end
