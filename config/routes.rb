Rails.application.routes.draw do
  # get 'comments/create'
  # get 'features/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
    #   # get 'features/index'
    #   # get 'comments/create'
    #   resources :features, only: [:index] do
    #     collection do
    #       get 'page/:page_number/per_page/:per_page', action: :index
    #     end
    #     resources :comments, only: [:create]
    #   end
      get 'features', to: 'features#index', as: 'featureList'
      get 'comments', to: 'comments#create', as: 'createComment'
    end

  end

  
  # Defines the root path route ("/")
  # root "articles#index"
end
