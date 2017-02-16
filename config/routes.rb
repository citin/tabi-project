Rails.application.routes.draw do
  resources :graphics do
    collection do
      get 'test'
      get 'cultural_events'
      post 'display_event'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
