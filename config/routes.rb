Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :features, only: [:index] do
        resources :comments, only: [:create], param: :feature_id
      end
    end

  end

  
  # Defines the root path route ("/")
  # root "articles#index"
end
