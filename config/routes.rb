Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'movies#index'
  resources :movies do
    resources :reviews do
      resource :likes, only: %i[create]
    end
    resources :ratings
  end
end
