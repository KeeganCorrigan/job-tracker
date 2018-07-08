Rails.application.routes.draw do

  resources :companies

  resources :dashboard, only: [:index]

  resources :categories

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
