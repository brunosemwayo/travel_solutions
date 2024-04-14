Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :itineraries do
        member do
          get 'print', to: 'itineraries#print_pdf', defaults: { format: 'pdf' }
        end
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Catch all route for handling routing to the front-end application, such as a React app
  get '/*path' => 'home#index'
end
