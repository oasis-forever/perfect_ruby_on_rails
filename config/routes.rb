Rails.application.routes.draw do
  resources :events do
    resources :tickets
  end
  root   'welcome#index'
  get    '/auth/:provider/callback' => 'sessions#create'
  delete '/logout'                  => 'sessions#destroy'
end
