Rails.application.routes.draw do
  root   'events#index'
  get    '/status'                  => 'status#index', defaults: { format: :json }
  get    '/auth/:provider/callback' => 'sessions#create'
  delete '/logout'                  => 'sessions#destroy'

  resources :events, only: %i(index new create show edit update destroy) do
    resources :tickets, only: %i(new create destroy)
  end

  resource :retirements, only: %i(new create)
end
