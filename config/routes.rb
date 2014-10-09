Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    match 'events' => "events#index", via: :options
    resources :events, only: [:index, :create]
    resources :sites, only: []
  end
end
