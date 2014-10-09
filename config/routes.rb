Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    match 'events' => "events#index", via: :options
  end
end
