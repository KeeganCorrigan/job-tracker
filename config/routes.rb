Rails.application.routes.draw do

  resources :companies do
    resources :jobs, only: [:index, :show] do
    end
  end

  resources :dashboard, only: [:index]

  resources :categories, only: [:index, :show, :new]

  resources :jobs

  # resources :categories do
  #   resources :jobs
  # end
end

=begin
resources :artists, shallow: true do
  resources :songs
end

resources :songs, only: [:index]
=end
