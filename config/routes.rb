Rails.application.routes.draw do

  devise_for :users

  namespace :api, defaults: {format: 'json'} do
    match 'events' => "events#index", via: :options
    resources :events, only: [:index, :create]
  end

  root to: "home#index"

end
