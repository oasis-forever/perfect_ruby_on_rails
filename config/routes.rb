Rails.application.routes.draw do
  root   'events#index'
  get    '/status'                  => 'status#index', defaults: { format: :json }
  get    '/auth/:provider/callback' => 'sessions#create'
  delete '/logout'                  => 'sessions#destroy'

  resources :events do
    resources :tickets, only: %i(new create destroy)
  end

  resource :retirements, only: %i(new create)
end
