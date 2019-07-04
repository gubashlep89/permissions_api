Rails.application.routes.draw do
  resources :roles
  resources :users do
    member do
      get :check_permission
      post :grant_permissions
    end
  end
end
