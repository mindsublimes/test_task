Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount API::Base,  at:'/'
  resources :users do
    collection do
      get :sign_up
      get :sign_in
      post :sign_in_user
      get :sign_out
    end
  end

  resources :jobs
end
