Rails.application.routes.draw do
  root   'welcome#index'
  get    '/auth/:provider/callback' => 'sessions#create'
  delete '/logout'                  => 'sessions#destroy'

  resources :events do
    resources :tickets
  end

  resource :retirements, only: [:new, :create]
end
