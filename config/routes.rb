Rails.application.routes.draw do
  concern :api_base do
    resources :activities, only: [:index]
    resources :babies, only: [:index]
  end

  namespace :api do
    concerns :api_base
  end

end
