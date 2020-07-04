Rails.application.routes.draw do
  concern :api_base do
    resources :activities, only: [:index]
    resources :babies, only: [:index] do
      member do
        get :activity_logs
      end
    end
    resources :activity_logs, only: [:create, :update]
  end

  namespace :api do
    concerns :api_base
  end

end
