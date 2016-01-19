Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  resources :places do
    collection do
      get 'search'
      get 'nearby'
    end
  end

  root to: 'places#index'
end
