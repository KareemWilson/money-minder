Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  authenticated :user do
    root 'categories#index', as: :authenticated_root
    resources :categories do
      resources :payments  
    end
  end
  
  unauthenticated do
    root 'splash#index', as: :unauthenticated_root
  end
end