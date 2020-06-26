Rails.application.routes.draw do
  root to: 'top#index'
  resources :users
  resources :auths, only: [:new, :create, :destroy]
  resources :rooms do
    resources :entries, only: [:new, :create, :destroy, :index],
          path: :rentals, shallow: true do
      post :confirm, on: :collection
      post :confirm_back, on: :collection
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
