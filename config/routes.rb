Rails.application.routes.draw do
  root to: 'properties#index'
  resources :stations
  resources :properties
end
